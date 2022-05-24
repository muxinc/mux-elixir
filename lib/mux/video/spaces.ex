defmodule Mux.Video.Spaces do
  @moduledoc """
  This module provides functions for managing Spaces in Mux Video. [API Documentation](https://docs.mux.com/api-reference/video#tag/spaces)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/spaces"

  @doc """
  Create a new space.

  Returns `{:ok, space, %Tesla.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, space, _env} = Mux.Video.Spaces.create(client, %{type: "server", passthrough: "example", broadcasts: [%{passthrough: "example", live_stream_id: "vJvFbCojkuSDAAeEK4EddOA01wRqN1mP4", layout: "gallery", background: "https://example.com/background.jpg", resolution: "1920x1080"}]})
      iex> space
      #{inspect(Fixtures.space())}

  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List spaces.

  Returns a tuple such as `{:ok, spaces, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, spaces, _env} = Mux.Video.Spaces.list(client)
      iex> spaces
      #{inspect([Fixtures.space(), Fixtures.space()])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a space by ID.

  Returns a tuple such as `{:ok, space, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, space, _env} = Mux.Video.Spaces.get(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk")
      iex> space
      #{inspect(Fixtures.space())}

  """
  def get(client, space_id, params \\ []) do
    Base.get(client, "#{@path}/#{space_id}", query: params)
  end

  @doc """
  Delete a space.

  Returns a tuple such as `{:ok, "", %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.Spaces.delete(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk")
      iex> status
      :ok

  """
  def delete(client, space_id, params \\ []) do
    Base.delete(client, "#{@path}/#{space_id}", query: params)
  end

  @doc """
  Create a new space broadcast.

  Returns a tuple such as `{:ok, broadcast, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, broadcast, _env} = Mux.Video.Spaces.create_space_broadcast(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk", %{passthrough: "example", live_stream_id: "vJvFbCojkuSDAAeEK4EddOA01wRqN1mP4", layout: "gallery", background: "https://example.com/background.jpg", resolution: "1920x1080"})
      iex> broadcast
      #{inspect(Fixtures.broadcast())}

  """
  def create_space_broadcast(client, space_id, params) do
    Base.post(client, "#{@path}/#{space_id}/broadcasts", params)
  end

  @doc """
  Retrieve a space broadcast.

  Returns a tuple such as `{:ok, broadcast, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, broadcast, _env} = Mux.Video.Spaces.get_space_broadcast(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk", "fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ")
      iex> broadcast
      #{inspect(Fixtures.broadcast())}

  """
  def get_space_broadcast(client, space_id, broadcast_id, params \\ []) do
    Base.get(client, "#{@path}/#{space_id}/broadcasts/#{broadcast_id}", query: params)
  end

  @doc """
  Delete a space broadcast.

  Returns a tuple such as `{:ok, "", %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.Spaces.delete_space_broadcast(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk", "fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ")
      iex> status
      :ok

  """
  def delete_space_broadcast(client, space_id, broadcast_id, params \\ []) do
    Base.delete(client, "#{@path}/#{space_id}/broadcasts/#{broadcast_id}", query: params)
  end

  @doc """
  Start a space broadcast.

  Returns a tuple such as `{:ok, %{}, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, %{}, _env} = Mux.Video.Spaces.start_space_broadcast(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk", "fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ")
      iex> status
      :ok

  """
  def start_space_broadcast(client, space_id, broadcast_id) do
    Base.post(client, "#{@path}/#{space_id}/broadcasts/#{broadcast_id}/start", %{})
  end

  @doc """
  Stop a space broadcast.

  Returns a tuple such as `{:ok, %{}, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, %{}, _env} = Mux.Video.Spaces.stop_space_broadcast(client, "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk", "fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ")
      iex> status
      :ok

  """
  def stop_space_broadcast(client, space_id, broadcast_id) do
    Base.post(client, "#{@path}/#{space_id}/broadcasts/#{broadcast_id}/stop", %{})
  end
end
