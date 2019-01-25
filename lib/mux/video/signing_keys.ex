defmodule Mux.Video.SigningKeys do
  @moduledoc """
  This module provides functions for managing signing keys in Mux Video. [API Documentation](https://docs.mux.com/docs/security-signed-urls)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/signing-keys/"

  @doc """
  Create a new signing key.

  Returns `{:ok, signing_key, %Tesla.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> Mux.Video.SigningKeys.create(client)
      {:ok, #{inspect Fixtures.signing_key(:create)}, #{inspect Fixtures.tesla_env({:signing_key, [:create]})}}

  """
  def create(client) do
    Base.post(client, @path, %{})
  end

  @doc """
  List signing keys.

  Returns a tuple such as `{:ok, signing_keys, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, signing_keys, _env} = Mux.Video.SigningKeys.list(client)
      iex> signing_keys
      #{inspect [Fixtures.signing_key(), Fixtures.signing_key()]}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a signing key by ID.

  Returns a tuple such as `{:ok, signing_key, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, signing_key, _env} = Mux.Video.SigningKeys.get(client, "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C")
      iex> signing_key
      #{inspect Fixtures.signing_key()}

  """
  def get(client, key_id, options \\ []) do
    Base.get(client, @path <> key_id, query: options)
  end

  @doc """
  Delete a signing key.

  Returns a tuple such as `{:ok, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.SigningKeys.delete(client, "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C")
      iex> status
      :ok

  """
  def delete(client, key_id, params \\ []) do
    Base.delete(client, @path <> key_id, query: params)
  end
end
