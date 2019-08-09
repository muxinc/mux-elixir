defmodule Mux.Data.Errors do
  @moduledoc """
  This module provides functions for working with playback errors, which is typically an error
  thrown by the player that caused playback failure. [API Documentation](https://api-docs.mux.com/#view-error).
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Returns a list of playback errors along with details and statistics about them.

  Returns `{:ok, errors, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, errors, _env} = Mux.Data.Errors.list(client)
      iex> errors
      #{inspect(Fixtures.errors()["data"])}

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, errors, _env} = Mux.Data.Errors.list(client, filters: ["operating_system:windows"], timeframe: ["24:hours"])
      iex> errors
      #{inspect(Fixtures.errors()["data"])}

  """
  def list(client, params \\ []) do
    Base.get(client, build_base_path(), query: params)
  end

  defp build_base_path(), do: "/data/v1/errors"
end
