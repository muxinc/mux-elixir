defmodule Mux.Data.RealTimeTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.RealTime

  @base_url "https://api.mux.com/data/v1/realtime"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{
        method: :get,
        url: @base_url <> "/dimensions"
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.realtime_dimensions()}

      %{
        method: :get,
        url: @base_url <> "/metrics"
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.realtime_metrics()}

      %{
        method: :get,
        url: @base_url <> "/metrics/playback-failure-percentage/breakdown",
        query: [
          dimension: 'country',
          timestamp: 1_547_853_000,
          filters: ['operating_system:windows']
        ]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.realtime_breakdown()}

      %{
        method: :get,
        url: @base_url <> "/metrics/video-startup-time/histogram-timeseries",
        query: [filters: ['operating_system:windows', 'country:US']]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.realtime_histogram_timeseries()}

      %{
        method: :get,
        url: @base_url <> "/metrics/playback-failure-percentage/timeseries",
        query: [filters: ['operating_system:windows', 'country:US']]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.realtime_timeseries()}
    end)

    {:ok, %{client: client}}
  end
end
