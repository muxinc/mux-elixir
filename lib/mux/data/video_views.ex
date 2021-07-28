defmodule Mux.Data.VideoViews do
  @moduledoc """
  This module provides functions for interacting with individual video views. Note, the raw video views
  contain _quite_ a lot of data, so the `list` endpoint includes a filtered set of keys for each view.
  [API Documentation](https://api-docs.mux.com/#video-view).
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Returns a paginated list of video views that occurred within the specified
  timeframe. Results are ordered by `view_end`, according to what you provide for
  `order_direction`.

  Returns `{:ok, raw_env | views}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: views} = _env} = Mux.Data.VideoViews.list(client)
      iex> views
      #{inspect(Fixtures.video_views()["data"])}

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: views} = _env} = Mux.Data.VideoViews.list(client, filters: ["browser:Chrome"], order_direction: "desc", page: 2)
      iex> views
      #{inspect(Fixtures.video_views()["data"])}

  """
  def list(client, params \\ []) do
    Base.get(client, build_base_path(), query: params)
  end

  @doc """
  Returns the details for a single video view.

  Returns `{:ok, raw_env | view}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: view} = _env} = Mux.Data.VideoViews.get(client, "k8n4aklUyrRDekILDWta1qSJqNFpYB7N50")
      iex> view["id"] === "k8n4aklUyrRDekILDWta1qSJqNFpYB7N50"
      true

  """
  def get(client, id) do
    Base.get(client, build_base_path() <> "/#{id}")
  end

  defp build_base_path(), do: "/data/v1/video-views"
end
