defmodule Mux.Video.LiveStreams do
  @moduledoc """
  This module provides functions for managing live streams in Mux Video. [API Documentation](https://docs.mux.com/v1/reference#live-streams)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/live-streams"

  @doc """
  Create a new live stream. [API Documentation](https://docs.mux.com/reference#create-a-live-stream)

  Returns `{:ok, live_stream, %Tesla.Env{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.create(client, %{playback_policy: "public", new_asset_settings: %{playback_policy: "public"}})
      iex> live_stream
      #{inspect(Fixtures.live_stream())}
  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List all live streams. [API Documentation](https://docs.mux.com/reference#list-live-streams)

  Returns a tuple such as `{:ok, live_streams, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_streams, _env} = Mux.Video.LiveStreams.list(client)
      iex> live_streams
      #{inspect([Fixtures.live_stream(), Fixtures.live_stream()])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a live stream by ID. [API Documentation](https://docs.mux.com/reference#retrieve-a-live-stream)

  Returns a tuple such as `{:ok, live_stream, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.get(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> live_stream
      #{inspect(Fixtures.live_stream())}

  """
  def get(client, live_stream_id, options \\ []) do
    Base.get(client, "#{@path}/#{live_stream_id}", query: options)
  end

  @doc """
  Delete a live stream. [API Documentation](https://docs.mux.com/reference#delete-a-live-stream)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _data, _env} = Mux.Video.LiveStreams.delete(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> status
      :ok

  """
  def delete(client, live_stream_id) do
    Base.delete(client, "#{@path}/#{live_stream_id}")
  end

  @doc """
  Signal a live stream is finished. [API Documentation](https://docs.mux.com/reference#signal-live-stream-complete)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.signal_complete(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> status
      :ok

  """
  def signal_complete(client, live_stream_id) do
    Base.put(client, "#{@path}/#{live_stream_id}/complete", %{})
  end

  @doc """
  Reset a live stream key if you want to immediately stop the current stream key
  from working and create a new stream key that can be used for future broadcasts.
  [API Documentation](https://docs.mux.com/reference#reset-a-stream-key)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.reset_stream_key(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> live_stream
      #{inspect(Fixtures.live_stream())}

  """
  def reset_stream_key(client, live_stream_id) do
    Base.post(client, "#{@path}/#{live_stream_id}/reset-stream-key", %{})
  end

  @doc """
  Create a live stream playback ID. [API Documentation](https://docs.mux.com/reference#add-a-live-stream-playback-id)

  Returns a tuple such as `{:ok, playback_ids, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.LiveStreams.create_playback_id(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", %{policy: "public"})
      iex> playback_id
      #{inspect(Fixtures.playback_id())}

  """
  def create_playback_id(client, live_stream_id, params) do
    Base.post(client, "#{@path}/#{live_stream_id}/playback-ids", params)
  end

  @doc """
  Retrieve a playback ID.

  Returns `{:ok, playback_id, %Telsa.Env{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.LiveStreams.get_playback_id(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> playback_id
      #{inspect(Fixtures.playback_id())}

  """
  def get_playback_id(client, live_stream_id, playback_id) do
    Base.get(client, "#{@path}/#{live_stream_id}/playback-ids/#{playback_id}")
  end

  @doc """
  Delete a live stream playback ID. [API Documentation](https://docs.mux.com/reference#delete-a-live-stream-playback-id)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.delete_playback_id(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> status
      :ok

  """
  def delete_playback_id(client, live_stream_id, playback_id) do
    Base.delete(client, "#{@path}/#{live_stream_id}/playback-ids/#{playback_id}")
  end

  @doc """
  Create a live stream simulcast target. [API Documentation](https://docs.mux.com/reference#create-a-simulcast-target)

  Returns a tuple such as `{:ok, simulcast_target, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, simulcast_target, _env} = Mux.Video.LiveStreams.create_simulcast_target(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", %{url: "rtmp://live.example.com/app", stream_key: "abcdefgh"})
      iex> simulcast_target
      #{inspect(Fixtures.simulcast_target())}

  """
  def create_simulcast_target(client, live_stream_id, params) do
    Base.post(client, "#{@path}/#{live_stream_id}/simulcast-targets", params)
  end

  @doc """
  Retrieve a live stream simulcast target. [API Documentation](https://docs.mux.com/reference#retrieve-a-simulcast-target)

  Returns a tuple such as `{:ok, simulcast_target, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, simulcast_target, _env} = Mux.Video.LiveStreams.get_simulcast_target(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", "vuOfW021mz5QA500wYEQ9SeUYvuYnpFz011mqSvski5T8claN02JN9ve2g")
      iex> simulcast_target
      #{inspect(Fixtures.simulcast_target())}

  """
  def get_simulcast_target(client, live_stream_id, simulcast_target_id) do
    Base.get(client, "#{@path}/#{live_stream_id}/simulcast-targets/#{simulcast_target_id}")
  end

  @doc """
  Delete a live stream simulcast target. [API Documentation](https://docs.mux.com/reference#delete-a-simulcast-target)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.delete_simulcast_target(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", "vuOfW021mz5QA500wYEQ9SeUYvuYnpFz011mqSvski5T8claN02JN9ve2g")
      iex> status
      :ok

  """
  def delete_simulcast_target(client, live_stream_id, simulcast_target_id) do
    Base.delete(client, "#{@path}/#{live_stream_id}/simulcast-targets/#{simulcast_target_id}")
  end

  @doc """
  Enable a live stream is finished. [API Documentation](https://docs.mux.com/reference#enable-a-live-stream)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.enable(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> status
      :ok

  """
  def enable(client, live_stream_id) do
    Base.put(client, "#{@path}/#{live_stream_id}/enable", %{})
  end

  @doc """
  Disable a live stream is finished. [API Documentation](https://docs.mux.com/reference#disable-a-live-stream)

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, _, _env} = Mux.Video.LiveStreams.disable(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY")
      iex> status
      :ok

  """
  def disable(client, live_stream_id) do
    Base.put(client, "#{@path}/#{live_stream_id}/disable", %{})
  end

  @doc """
  Updates a live stream. See https://docs.mux.com/api-reference/video#operation/update-live-stream for
  the values that are allowed.

  Returns a tuple such as `{:ok, live_stream, %Tesla.Env{}}

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.update(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", %{passthrough: "updated_passthrough", "latency_mode": "low", "max_continuous_duration": 21600, "reconnect_window": 30})
      iex> live_stream
      #{inspect(Fixtures.live_stream(:update))}
  """
  def update(client, live_stream_id, params) do
    Base.patch(client, "#{@path}/#{live_stream_id}", params)
  end

  @doc """
  Updates a live stream's embedded subtitles

  Returns a tuple such as `{:ok, live_stream, %Tesla.Env{}}

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, live_stream, _env} = Mux.Video.LiveStreams.update_embedded_subtitles(client, "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY", %{embedded_subtitles: %{name: "English CC", passthrough: "Example", language_code: "en", language_channel: "cc1"}})
      iex> live_stream
      #{inspect(Fixtures.live_stream(:subtitles))}
  """
  def update_embedded_subtitles(client, live_stream_id, params) do
    Base.put(client, "#{@path}/#{live_stream_id}/embedded-subtitles", params)
  end
end
