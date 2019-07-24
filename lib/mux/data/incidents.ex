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
      iex> {:ok, incidents, _env} = Mux.Data.Incidents.list(client)
      iex> incidents
      #{inspect(Fixtures.incidents["data"])}

  """
  def list(client, params \\[]) do
    Base.get(client, build_base_path(), query: params)
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

  @doc """
  Lists all the incidents that seem related to a specific incident.

  Returns `{:ok, incidents, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, incidents, _env} = Mux.Data.Incidents.related(client, "ABCD1234", measurement: "median")
      iex> incidents
      #{inspect(Fixtures.related_incidents["data"])}

  """
  def related(client, id, params \\[]) do
    Base.get(client, build_base_path() <> "/#{id}/related", query: params)
  end

  defp build_base_path(), do: "/data/v1/incidents"
end
