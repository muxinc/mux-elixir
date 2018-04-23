defmodule Mux.Data.ExportsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Exports

  @base_url "https://api.mux.com/data/v1/exports"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.exports()}
    end

    {:ok, %{client: client}}
  end
end
