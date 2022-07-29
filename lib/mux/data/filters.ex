defmodule Mux.Data.Filters do
  @moduledoc """
  This module includes functions for retrieving available filters and their values in our system. These
  endpoints, for example, are used to construct the breakdown tables in the metrics UI. [API Documentation](https://docs.mux.com/api-reference/data#tag/filters)

  This module has been deprecated in favor of `Data.Dimensions`.
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Lists all the filters broken out into basic and advanced.

  This method has been deprecated in favor of `Data.Dimensions.list`.

  Returns `{:ok, filters, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, filters, _env} = Mux.Data.Filters.list(client)
      iex> filters
      #{inspect(Fixtures.filters()["data"])}

  """
  def list(client) do
    Base.get(client, build_base_path())
  end

  @doc """
  Lists the values for a specific filter along with a total count of related views.

  This method has been deprecated in favor of `Data.Dimensions.get`.

  Returns `{:ok, filters, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, filters, _env} = Mux.Data.Filters.get(client, "browser")
      iex> filters
      #{inspect(Fixtures.filters(:browser)["data"])}

  """
  def get(client, value, params \\ []) do
    Base.get(client, build_base_path() <> "/#{value}", query: params)
  end

  defp build_base_path(), do: "/data/v1/filters"
end
