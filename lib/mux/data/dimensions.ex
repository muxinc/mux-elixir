defmodule Mux.Data.Dimensions do
  @moduledoc """
  This module includes functions for retrieving available dimensions and their values in our system. These
  endpoints, for example, are used to construct the breakdown tables in the metrics UI. [API Documentation](https://docs.mux.com/api-reference/data#tag/dimensions)
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Lists all the dimensions broken out into basic and advanced.

  Returns `{:ok, dimensions, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, dimensions, _env} = Mux.Data.Dimensions.list(client)
      iex> dimensions
      #{inspect(Fixtures.dimensions()["data"])}

  """
  def list(client) do
    Base.get(client, build_base_path())
  end

  @doc """
  Lists the values for a specific dimension along with a total count of related views.

  Returns `{:ok, dimensions, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, dimensions, _env} = Mux.Data.Dimensions.get(client, "browser")
      iex> dimensions
      #{inspect(Fixtures.dimensions(:browser)["data"])}

  """
  def get(client, value, params \\ []) do
    Base.get(client, build_base_path() <> "/#{value}", query: params)
  end

  defp build_base_path(), do: "/data/v1/dimensions"
end
