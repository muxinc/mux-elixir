defmodule Mux.Data.Incidents do
  @moduledoc """
  This module includes functions for retrieving available incidents and their values in our system. These
  endpoints, for example, are used to construct the incidents tables in the alerts UI. [API Documentation](https://api-docs.mux.com/#incident)
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Lists all incidents.

  Returns `{:ok, incidents, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, filters, _env} = Mux.Data.Incidents.list(client)
      iex> filters
      #{inspect(Fixtures.incidents["data"])}

  """
  def list(client) do
    Base.get(client, build_base_path())
  end

  @doc """
  Lists details for a single incident.

  Returns `{:ok, incident, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, incident, _env} = Mux.Data.Incidents.get(client, "ABCD1234")
      iex> incident
      #{inspect(Fixtures.incident["data"])}

  """
  def get(client, id) do
    Base.get(client, build_base_path() <> "/#{id}")
  end

  defp build_base_path(), do: "/data/v1/incidents"
end
