defmodule Mux.Data.VideoViewsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.VideoViews

  @base_url "https://api.mux.com/data/v1/video-views"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.video_views()}

      %{method: :get, url: @base_url <> "/k8n4aklUyrRDekILDWta1qSJqNFpYB7N50"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.video_view()}
    end)

    {:ok, %{client: client}}
  end
end
