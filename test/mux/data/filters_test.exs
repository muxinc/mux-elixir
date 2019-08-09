defmodule Mux.Data.FiltersTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Filters

  @base_url "https://api.mux.com/data/v1/filters"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.filters()}

      %{method: :get, url: @base_url <> "/browser"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.filters(:browser)}
    end)

    {:ok, %{client: client}}
  end
end
