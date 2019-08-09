defmodule Mux.Webhooks do
  @moduledoc """
  This module provides a function for verifying webhook signatures
  """
  @default_tolerance 300
  @expected_scheme "v1"

  @doc """
  Verifies a webhook signature. Pass in the raw request body, the
  signature header that came with the webhook request ('Mux-Signature')
  and the webhook "secret" from your webhooks dashboard. Note that the
  webhook secret is different than your API secret.

  Returns `:ok`. Or a tuple with `{:error, "message"}`

  ## Examples

      iex> Mux.Webhooks.verify_header(raw_request_body, signature_header, secret)
      :ok
  """
  def verify_header(payload, signature_header, secret, tolerance \\ @default_tolerance) do
    case get_timestamp_and_signatures(signature_header, @expected_scheme) do
      {nil, _} ->
        {:error, "Unable to extract timestamp and signatures from header"}

      {_, []} ->
        {:error, "No signatures found with expected scheme #{@expected_scheme}"}

      {timestamp, signatures} ->
        with {:ok, timestamp} <- check_timestamp(timestamp, tolerance),
             {:ok, _signatures} <- check_signatures(signatures, timestamp, payload, secret) do
          :ok
        else
          {:error, error} -> {:error, error}
        end
    end
  end

  defp get_timestamp_and_signatures(signature_header, scheme) do
    signature_header
    |> String.split(",")
    |> Enum.map(&String.split(&1, "="))
    |> Enum.reduce({nil, []}, fn
      ["t", timestamp], {nil, signatures} ->
        {to_integer(timestamp), signatures}

      [^scheme, signature], {timestamp, signatures} ->
        {timestamp, [signature | signatures]}

      _, acc ->
        acc
    end)
  end

  defp to_integer(timestamp) do
    case Integer.parse(timestamp) do
      {timestamp, _} ->
        timestamp

      :error ->
        nil
    end
  end

  defp check_timestamp(timestamp, tolerance) do
    now = System.system_time(:second)

    if timestamp < now - tolerance do
      {:error, "Timestamp outside the tolerance zone"}
    else
      {:ok, timestamp}
    end
  end

  defp check_signatures(signatures, timestamp, payload, secret) do
    signed_payload = "#{timestamp}.#{payload}"
    expected_signature = compute_signature(signed_payload, secret)

    if Enum.any?(signatures, &secure_equals?(&1, expected_signature)) do
      {:ok, signatures}
    else
      {:error, "No signatures found matching the expected signature for payload"}
    end
  end

  defp compute_signature(payload, secret) do
    :crypto.hmac(:sha256, secret, payload)
    |> Base.encode16(case: :lower)
  end

  defp secure_equals?(input, expected) when byte_size(input) == byte_size(expected) do
    input = String.to_charlist(input)
    expected = String.to_charlist(expected)
    secure_compare(input, expected)
  end

  defp secure_equals?(_, _), do: false

  defp secure_compare(acc \\ 0, input, expected)
  defp secure_compare(acc, [], []), do: acc == 0

  defp secure_compare(acc, [input_codepoint | input], [expected_codepoint | expected]) do
    import Bitwise

    acc
    |> bor(input_codepoint ^^^ expected_codepoint)
    |> secure_compare(input, expected)
  end
end
