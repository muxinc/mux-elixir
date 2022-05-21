defmodule Mux.Data.Exports do
  @moduledoc """
  This module provides functions for accessing lists of data exports. Currently the only exports
  available are raw video views. [API Documentation](https://docs.mux.com/api-reference/data#tag/exports)

  **Note:** These endpoints require that your plan has access to specific features. [Reach out to us](mailto:help@mux.com)
  if you have questions.
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Lists the available video view exports along with URLs to retrieve them.

  Returns `{:ok, exports, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, exports, _env} = Mux.Data.Exports.list(client)
      iex> exports
      #{inspect(Fixtures.exports()["data"])}

  """
  def list(client) do
    Base.get(client, build_base_path())
  end

  defp build_base_path(), do: "/data/v1/exports"
end
