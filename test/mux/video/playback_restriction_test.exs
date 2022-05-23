defmodule Mux.Video.PlaybackRestrictionsTest do
  use ExUnit.Case
  import Tesla.Mock

  doctest Mux.Video.PlaybackRestrictions

  @base_url "https://api.mux.com/video/v1/playback-restrictions"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [
              Mux.Fixtures.playback_restriction(),
              Mux.Fixtures.playback_restriction()
            ]
          }
        }

      %{method: :get, url: @base_url <> "/uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.playback_restriction()
          }
        }

      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.playback_restriction()
          }
        }

      %{
        method: :delete,
        url:
          @base_url <>
              "/uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3"
      } ->
        %Tesla.Env{status: 204, body: ""}

      %{
        method: :put,
        url: @base_url <> "/uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3/referrer"
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.playback_restriction()
          }
        }
    end)

    {:ok, %{client: client}}
  end
end
