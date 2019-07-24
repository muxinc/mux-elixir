defmodule Mux.Data.IncidentsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Incidents

  @base_url "https://api.mux.com/data/v1/incidents"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.incidents()}

      %{method: :get, url: @base_url <> "/ABCD1234"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.incident()}

      %{method: :get, url: @base_url <> "/ABCD1234/related"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.related_incidents()}
    end)

    {:ok, %{client: client}}
  end
end
