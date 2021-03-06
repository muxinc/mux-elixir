defmodule Mux.TracksTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Video.Tracks

  @base_url "https://api.mux.com/video/v1/assets/00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc/tracks"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.track()
          }
        }

      %{method: :get, url: @base_url <> "/FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.track()
          }
        }

      %{method: :delete, url: @base_url <> "/FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"} ->
        %Tesla.Env{status: 204, body: ""}
    end)

    {:ok, %{client: client}}
  end
end
