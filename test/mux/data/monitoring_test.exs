defmodule Mux.Data.MonitoringTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Data.Monitoring

  @base_url "https://api.mux.com/data/v1/monitoring"

  setup do
    client = Mux.Base.new("token_id", "token_secret")

    mock(fn
      %{
        method: :get,
        url: @base_url <> "/dimensions"
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.monitoring_dimensions()}

      %{
        method: :get,
        url: @base_url <> "/metrics"
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.monitoring_metrics()}

      %{
        method: :get,
        url: @base_url <> "/metrics/playback-failure-percentage/breakdown",
        query: [
          dimension: "country",
          timestamp: 1_547_853_000,
          filters: ["operating_system:windows"]
        ]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.monitoring_breakdown()}

      %{
        method: :get,
        url: @base_url <> "/metrics/video-startup-time/histogram-timeseries",
        query: [filters: ["operating_system:windows", "country:US"]]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.monitoring_histogram_timeseries()}

      %{
        method: :get,
        url: @base_url <> "/metrics/playback-failure-percentage/timeseries",
        query: [filters: ["operating_system:windows", "country:US"]]
      } ->
        %Tesla.Env{status: 200, body: Mux.Fixtures.monitoring_timeseries()}
    end)

    {:ok, %{client: client}}
  end
end
