defmodule Mux.Video.Uploads do
  @moduledoc """
  This module provides functions for managing direct uploads in Mux Video. [API Documentation](https://docs.mux.com/docs/direct-upload)
  """

  alias Mux.{Base, Fixtures}

  @path "/video/v1/uploads/"

  @doc """
  Create a new direct upload.

  Returns `{:ok, %Tesla.Client{} | upload}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> params = %{"new_asset_settings" => %{"playback_policies" => ["public"]}, "cors_origin" => "http://localhost:8080"}
      iex> {:ok, %{clean_body: upload} = _env} = Mux.Video.Uploads.create(client, params)
      iex> upload
      #{inspect(Fixtures.upload(:create))}
  }}

  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List direct uploads.

  Returns a tuple such as `{:ok, %Telsa.Env{} | uploads}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: uploads} = _env} = Mux.Video.Uploads.list(client)
      iex> uploads
      #{inspect([Fixtures.upload(), Fixtures.upload()])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a direct upload by ID.

  Returns a tuple such as `{:ok, %Telsa.Env{} | upload}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: upload} = _env} = Mux.Video.Uploads.get(client, "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM")
      iex> upload
      #{inspect(Fixtures.upload())}

  """
  def get(client, key_id, options \\ []) do
    Base.get(client, @path <> key_id, query: options)
  end

  @doc """
  Cancel a direct upload.

  Returns a tuple such as `{:ok, %Telsa.Env{} | direct_upload}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: direct_upload} = _env} = Mux.Video.Uploads.cancel(client, "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM")
      iex> direct_upload
      #{inspect(Fixtures.upload(:cancel))}

  """
  def cancel(client, key_id) do
    Base.put(client, @path <> key_id <> "/cancel", %{}, [])
  end
end
