defmodule Mux.UploadsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Video.Uploads

  @base_url "https://api.mux.com/video/v1/uploads/"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [Mux.Fixtures.upload(), Mux.Fixtures.upload()]
          }
        }

      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.upload(:create)
          }
        }

      %{method: :get, url: @base_url <> "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.upload()
          }
        }

      %{method: :put, url: @base_url <> "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM/cancel"} ->
        %Tesla.Env{status: 200, body: %{"data" => Mux.Fixtures.upload(:cancel)}}
    end)

    {:ok, %{client: client}}
  end
end
