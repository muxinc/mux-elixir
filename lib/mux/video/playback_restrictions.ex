defmodule Mux.Video.PlaybackRestrictions do
  @moduledoc """
  This module provides functions for managing Playback Restrictions in Mux Video. [API Documentation](https://docs.mux.com/api-reference/video#tag/playback-restrictions)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/playback-restrictions"

  @doc """
  Create a new playback restriction.

  Returns `{:ok, playback_restriction, %Tesla.Client{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_restriction, _env} = Mux.Video.PlaybackRestrictions.create(client, %{referrer: %{allowed_domains: ["*.example.com"], allow_no_referrer: true}})
      iex> playback_restriction
      #{inspect(Fixtures.playback_restriction())}

  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List playback restrictions.

  Returns a tuple such as `{:ok, playback_restrictions, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_restrictions, _env} = Mux.Video.PlaybackRestrictions.list(client)
      iex> playback_restrictions
      #{inspect([Fixtures.playback_restriction(), Fixtures.playback_restriction()])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a playback restriction by ID.

  Returns a tuple such as `{:ok, playback_restriction, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_restriction, _env} = Mux.Video.PlaybackRestrictions.get(client, "uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3")
      iex> playback_restriction
      #{inspect(Fixtures.playback_restriction())}

  """
  def get(client, playback_restriction_id, options \\ []) do
    Base.get(client, "#{@path}/#{playback_restriction_id}", query: options)
  end

  @doc """
  Delete a playback restriction.

  Returns a tuple such as `{:ok, "", %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.PlaybackRestrictions.delete(client, "uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3")
      iex> status
      :ok

  """
  def delete(client, playback_restriction_id, params \\ []) do
    Base.delete(client, "#{@path}/#{playback_restriction_id}", query: params)
  end

  @doc """
  Updates the referrer domain restriction for a playback restriction

  Returns a tuple such as `{:ok, playback_restriction, %Tesla.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, playback_restriction, _env} = Mux.Video.PlaybackRestrictions.update_referrer_domain_restriction(client, "uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3", %{allowed_domains: ["*.example.com"], allow_no_referrer: true})
      iex> playback_restriction
      #{inspect(Fixtures.playback_restriction())}

  """
  def update_referrer_domain_restriction(client, playback_restriction_id, params) do
    Base.put(client, "#{@path}/#{playback_restriction_id}/referrer", params)
  end
end
