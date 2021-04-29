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

  Returns `{:ok, identifier, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, identifier, _env} = Mux.Video.PlaybackIds.get(client, "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> identifier
      #{inspect(Fixtures.identifier())}

  """
  def get(client, playback_id) do
    Base.get(client, "#{@path}/#{playback_id}")
  end
end
