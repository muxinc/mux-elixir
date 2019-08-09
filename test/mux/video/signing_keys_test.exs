defmodule Mux.SigningKeysTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Video.SigningKeys

  @base_url "https://api.mux.com/video/v1/signing-keys/"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [Mux.Fixtures.signing_key(), Mux.Fixtures.signing_key()]
          }
        }

      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.signing_key(:create)
          }
        }

      %{method: :get, url: @base_url <> "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.signing_key()
          }
        }

      %{method: :delete, url: @base_url <> "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C"} ->
        %Tesla.Env{status: 204, body: ""}
    end)

    {:ok, %{client: client}}
  end
end
