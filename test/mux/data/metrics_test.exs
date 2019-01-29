defmodule Mux.Data.MetricsTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Metrics

  @base_url "https://api.mux.com/data/v1/metrics"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock fn
      %{method: :get,
        url: @base_url <> "/video_startup_time/breakdown",
        query: [group_by: "browser"]} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.breakdown()}
      %{method: :get,
        url: @base_url <> "/video_startup_time/breakdown",
        query: [group_by: "browser", measurement: "median", timeframe: ["6:hours"]]} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.breakdown()}
      %{method: :get,
        url: @base_url <> "/comparison",
        query: [dimension: "browser", value: "Safari"]} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.comparison()}
      %{method: :get,
        url: @base_url <> "/video_startup_time/insights"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.insights()}
      %{method: :get,
        url: @base_url <> "/video_startup_time/overall"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.overall()}
      %{method: :get,
        url: @base_url <> "/video_startup_time/timeseries"} ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.timeseries()}
    end

    {:ok, %{client: client}}
  end
end
