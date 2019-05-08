defmodule Mux.Video.LiveStreams do
  @moduledoc """
  This module provides functions for managing live streams in Mux Video. [API Documentation](https://docs.mux.com/v1/reference#live-streams)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/live-streams"

  @doc """
  Create a new live stream.

  Returns `{:ok, live_stream, %Tesla.Env{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.create(client, %{playback_policy: "public", new_asset_settings: %{playback_policy: 'public'}})
      iex> live_stream
      #{inspect Fixtures.live_stream()}
  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List all live streams.

  Returns a tuple such as `{:ok, live_streams, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_streams, _env} = Mux.Video.LiveStreams.list(client)
      iex> live_streams
      #{inspect [Fixtures.live_stream(), Fixtures.live_stream()]}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a live stream by ID.

  Returns a tuple such as `{:ok, live_stream, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.get(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> live_stream
      #{inspect Fixtures.live_stream()}

  """
  def get(client, live_stream_id, options \\ []) do
    Base.get(client, "#{@path}/#{live_stream_id}", query: options)
  end

  @doc """
  Delete a live stream.

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.LiveStreams.delete(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> status
      :ok

  """
  def delete(client, live_stream_id) do
    Base.delete(client, "#{@path}/#{live_stream_id}")
  end

  @doc """
  Signal a live stream is finished

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.signal_complete(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> status
      :ok

  """
  def signal_complete(client, live_stream_id) do
    Base.put(client, "#{@path}/#{live_stream_id}/complete")
  end

  @doc """
  Reset a live stream key if you want to immediately stop the current stream key
  from working and create a new stream key that can be used for future broadcasts.

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.reset_stream_key(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> live_stream
      #{inspect Fixtures.live_stream()}  

  """
  def reset_stream_key(client, live_stream_id) do
    Base.post(client, "#{@path}/#{live_stream_id}/reset-stream-key")
  end

  @doc """
  Create a live stream playback ID

  Returns a tuple such as `{:ok, playback_ids, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.create_playback_id(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{policy: "public"})
      iex> live_stream
      #{inspect Fixtures.playback_id}

  """
  def create_playback_id(client, live_stream_id, params) do
    Base.post(client, "#{@path}/#{live_stream_id}/playback-ids", params)
  end

  @doc """
  Delete a live stream playback ID

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.delete_playback_id(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> status
      :ok

  """
  def delete_playback_id(client, live_stream_id, playback_id) do
    Base.delete(client, "#{@path}/#{live_stream_id}/playback-ids/#{playback_id}")
  end
end
