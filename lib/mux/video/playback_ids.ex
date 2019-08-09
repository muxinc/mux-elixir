defmodule Mux.Video.PlaybackIds do
  @moduledoc """
  This module provides functions around managing Playback IDs in Mux Video. Playback IDs are the
  public identifier for streaming a piece of content and can include policies such as `signed` or
  `public`. [API Documentation](https://docs.mux.com/v1/reference#playback-ids).
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Create a new playback ID.

  Returns `{:ok, playback_id, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.PlaybackIds.create(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{policy: "public"})
      iex> playback_id
      #{inspect(Fixtures.playback_id())}

  """
  def create(client, asset_id, params) do
    Base.post(client, build_base_path(asset_id), params)
  end

  @doc """
  Retrieve a playback ID by ID.

  Returns `{:ok, playback_id, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.PlaybackIds.get(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> playback_id
      #{inspect(Fixtures.playback_id())}

  """
  def get(client, asset_id, playback_id) do
    Base.get(client, build_base_path(asset_id) <> "/" <> playback_id)
  end

  @doc """
  Delete a playback ID.

  Returns `{:ok, nil, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.PlaybackIds.delete(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> status
      :ok

  """
  def delete(client, asset_id, playback_id) do
    Base.delete(client, build_base_path(asset_id) <> "/" <> playback_id)
  end

  defp build_base_path(asset_id), do: "/video/v1/assets/#{asset_id}/playback-ids"
end
