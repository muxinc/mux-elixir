defmodule Mux.Token do
  @moduledoc """
  This module provides helpers for working with Playback IDs with `signed` playback policies. [API Documentation](https://docs.mux.com/docs/security-signed-urls)
  """

  @type signature_type :: :video | :thumbnail | :gif
  @type option ::
          {:type, signature_type}
          | {:expiration, integer}
          | {:token_id, String.t()}
          | {:token_secret, String.t()}
          | {:params, any}
  @type options :: [option]

  @doc """
  Create a signed URL token for a playback ID.

  `options` object can include:
  - `options.token_id`: Signing token ID (defaults to `Application.get_env(:mux, :signing_token_id)`)
  - `options.token_secret`: Signing token secret (defaults to `Application.get_env(:mux, :signing_token_secret)`)
  - `options.type`: Type of signature to create. Defaults to `:video`, options are: `:video, :gif, :thumbnail`
  - `options.expiration`: UTC Timestamp (in seconds) to expire the token. Defaults to 7 days from now (604,800)
  - `options.params`: Map that includes any additional query params. For thumbnails this would be values like `height` or `time`.
  """
  @spec sign(String.t(), options()) :: String.t()
  def sign(playback_id, opts \\ []) do
    opts = opts |> default_options()
    signer = opts[:token_secret] |> jwt_signer
    params = opts[:params]

    claims = %{
      "typ" => "JWT",
      "alg" => "RS256",
      "kid" => opts[:token_id]
    }

    payload =
      %{
        "aud" => opts[:type] |> type_to_aud(),
        "sub" => playback_id,
        "exp" => (DateTime.utc_now() |> DateTime.to_unix()) + opts[:expiration]
      }
      |> Map.merge(params)
      |> Jason.encode!()

    JOSE.JWS.sign(signer, payload, claims) |> JOSE.JWS.compact() |> elem(1)
  end

  def verify(token, opts \\ []) do
    %{token_secret: secret} = opts |> default_options()
    signer = secret |> jwt_signer()

    JOSE.JWS.verify(signer, token)
  end

  defp jwt_signer(secret) do
    secret
    |> get_private_key()
    |> JOSE.JWK.from_pem()
  end

  defp default_options(opts) do
    application_env = [
      token_id: Application.get_env(:mux, :signing_token_id),
      token_secret: Application.get_env(:mux, :signing_token_secret),
      expiration: 604_800,
      type: :video,
      params: %{}
    ]

    Keyword.merge(application_env, opts) |> Enum.into(%{})
  end

  defp get_private_key("-----BEGIN RSA PRIVATE KEY-----" <> _ = key), do: key
  defp get_private_key(key), do: Base.decode64!(key)

  defp type_to_aud(:video), do: "v"
  defp type_to_aud(:thumbnail), do: "t"
  defp type_to_aud(:gif), do: "g"
end
