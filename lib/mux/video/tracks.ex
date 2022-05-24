defmodule Mux.Video.Tracks do
  @moduledoc """
  This module provides functions around managing tracks in Mux Video. Tracks are
  used for subtitles/captions. [API Documentation](https://docs.mux.com/api-reference/video#operation/create-asset-track).
  """
  alias Mux.{Base, Fixtures}

  @doc """
  Create a new asset track. [API Documentation](https://docs.mux.com/api-reference/video#operation/create-asset-track)

  Returns `{:ok, track, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, track, _env} = Mux.Video.Tracks.create(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", %{url: "https://example.com/myVideo_en.srt", type: "text", text_type: "subtitles", language_code: "en" })
      iex> track
      #{inspect(Fixtures.track())}

  """
  def create(client, asset_id, params) do
    Base.post(client, build_base_path(asset_id), params)
  end

  @doc """
  Delete an asset track. [API Documentation](https://docs.mux.com/api-reference/video#operation/delete-asset-track)

  Returns `{:ok, "", raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.Tracks.delete(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc", "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE")
      iex> status
      :ok

  """
  def delete(client, asset_id, track_id) do
    Base.delete(client, build_base_path(asset_id) <> "/" <> track_id)
  end

  defp build_base_path(asset_id), do: "/video/v1/assets/#{asset_id}/tracks"
end
