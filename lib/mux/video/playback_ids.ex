defmodule Mux.Video.PlaybackIds do
  @moduledoc """
  This module provides functions around managing Playback IDs in Mux Video. Playback IDs are the
  public identifier for streaming a piece of content and can include policies such as `signed` or
  `public`. [API Documentation](https://docs.mux.com/api-reference/video#tag/playback-id).
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/playback-ids"

  @doc """
  Retrieve a asset or live stream identifier by Playback ID.

  Returns `{:ok, playback_id_full, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id_full, _env} = Mux.Video.PlaybackIds.get(client, "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> playback_id_full
      #{inspect(Fixtures.playback_id_full())}

  """
  def get(client, playback_id) do
    Base.get(client, "#{@path}/#{playback_id}")
  end
end
