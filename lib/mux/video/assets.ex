defmodule Mux.Video.Assets do
  @moduledoc """
  This module provides functions for managing assets in Mux Video. [API Documentation](https://docs.mux.com/v1/reference#assets)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/assets"

  @doc """
  Create a new asset.

  Returns `{:ok, asset, %Tesla.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> Mux.Video.Assets.create(client, %{input: "https://example.com/video.mp4"})
      {:ok, #{inspect(Fixtures.asset(:create))}, #{
    inspect(Fixtures.tesla_env({:asset, [:create]}))
  }}

  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List assets.

  Returns a tuple such as `{:ok, assets, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, assets, _env} = Mux.Video.Assets.list(client)
      iex> assets
      #{inspect([Fixtures.asset(), Fixtures.asset()])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve an asset by ID.

  Returns a tuple such as `{:ok, asset, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, asset, _env} = Mux.Video.Assets.get(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> asset
      #{inspect(Fixtures.asset())}

  """
  def get(client, asset_id, options \\ []) do
    Base.get(client, "#{@path}/#{asset_id}", query: options)
  end

  @doc """
  Delete an asset.

  Returns a tuple such as `{:ok, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.Assets.delete(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> status
      :ok

  """
  def delete(client, asset_id, params \\ []) do
    Base.delete(client, "#{@path}/#{asset_id}", query: params)
  end

  @doc """
  Retrieve the asset's input info.

  Returns a tuple such as `{:ok, input_info, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, input_info, _env} = Mux.Video.Assets.input_info(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      iex> input_info
      [#{inspect(Fixtures.input_info())}]

  """
  def input_info(client, asset_id, params \\ []) do
    Base.get(client, "#{@path}/#{asset_id}/input-info", query: params)
  end

  @doc """
  Updates an asset's mp4 support

  Returns a tuple such as `{:ok, asset, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, asset, _env} = Mux.Video.Assets.update_mp4_support(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{mp4_support: "standard"})
      iex> asset
      #{inspect(Fixtures.asset())}

  """
  def update_mp4_support(client, asset_id, params) do
    Base.put(client, "#{@path}/#{asset_id}/mp4-support", params)
  end

  @doc """
  Updates an asset's master access

  Returns a tuple such as `{:ok, asset, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, asset, _env} = Mux.Video.Assets.update_master_access(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{master_access: "temporary"})
      iex> asset
      #{inspect(Fixtures.asset())}

  """
  def update_master_access(client, asset_id, params) do
    Base.put(client, "#{@path}/#{asset_id}/master-access", params)
  end

  @doc """
  Create a new playback ID.

  Returns `{:ok, playback_id, %Telsa.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.Assets.create_playback_id(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{policy: "public"})
      iex> playback_id
      #{inspect(Fixtures.asset(:create))}

  """
  def create_playback_id(client, asset_id, params) do
    Base.post(client, "#{@path}/#{asset_id}/playback-ids", params)
  end

  @doc """
  Create a new playback ID.

  Returns `{:ok, playback_id, %Telsa.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_id, _env} = Mux.Video.Assets.create_playback_id(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{policy: "public"})
      iex> playback_id
      #{inspect(Fixtures.asset(:create))}

  """
  def get_playback_id(client, asset_id, playback_id) do
    Base.get(client, "#{@path}/#{asset_id}/playback-ids/#{playback_id}")
  end

  @doc """
  Delete a playback ID.

  Returns `{:ok, nil, %Telsa.Env{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.Assets.delete_playback_id(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> status
      :ok

  """
  def delete_playback_id(client, asset_id, playback_id) do
    Base.delete(client, "#{@path}/#{asset_id}/playback-ids/#{playback_id}")
  end
end
