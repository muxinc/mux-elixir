defmodule Mux.Data.DimensionsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Dimensions

  @base_url "https://api.mux.com/data/v1/dimensions"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.dimensions()}

      %{method: :get, url: @base_url <> "/browser"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.dimensions(:browser)}
    end)

    {:ok, %{client: client}}
  end
end
