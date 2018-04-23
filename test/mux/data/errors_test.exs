defmodule Mux.Data.ErrorsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Errors

  @base_url "https://api.mux.com/data/v1/errors"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.errors()}
    end

    {:ok, %{client: client}}
  end
end
