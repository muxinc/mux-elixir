defmodule Mux.Webhooks.TestUtils do
  @moduledoc """
  This module provides a utility function for generating valid signatures.
  You are encouraged to use it for testing how your application behaves
  against malicious requests.
  """

  @default_scheme "v1"

  @doc """
  Generates a webhook signature. Pass in the raw request body and the
  webhook "secret". You may also pass in the desired signature scheme.
  Currently, the only valid signature scheme is `"v1"`, which is also the
  default one if not set explicitly. Any invalid signature scheme will fall
  back to the default.

  Note that this function is intended for testing against malformed or
  malicious webhook requests, so you should use a fake webhook "secret".

  Returns the relevant HTTP header value as a string.

  ## Examples

      iex> signature = Mux.Webhooks.TestUtils.generate_signature("payload", "SuperSecret123")
      "t=1591664030,v1=e43496b6aae982c4c2fd6f8e92935f1d90216f1f64d56024e72390acfb988272"

      iex> Mux.Webhooks.verify_header("payload", signature, "SuperSecret123")
      :ok
  """
  def generate_signature(payload, secret, _scheme \\ @default_scheme) do
    # As long the `v1` will be the only signature scheme available, we can
    # simply ignore `_scheme`.
    timestamp = System.system_time(:second)
    signed_payload = "#{timestamp}.#{payload}"
    signature = compute_signature(signed_payload, secret)

    "t=#{timestamp},#{@default_scheme}=#{signature}"
  end

  def compute_signature(payload, secret) do
    hmac(:sha256, secret, payload)
    |> Base.encode16(case: :lower)
  end

  if Code.ensure_loaded?(:crypto) and function_exported?(:crypto, :mac, 4) do
    defp hmac(digest, key, payload), do: :crypto.mac(:hmac, digest, key, payload)
  else
    defp hmac(digest, key, payload), do: :crypto.hmac(digest, key, payload)
  end
end
