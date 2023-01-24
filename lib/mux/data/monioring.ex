defmodule Mux.Data.Monitoring do
  @moduledoc """
  This module provides functions that interact with the `monitoring` endpoints

  Note, these API documentation links may break periodically as we update documentation titles.
  - [Dimensions](https://docs.mux.com/api-reference/data#operation/list-monitoring-dimensions)
  - [Metrics](https://docs.mux.com/api-reference/data#operation/list-monitoring-metrics)
  - [Breakdown](https://docs.mux.com/api-reference/data#operation/get-monitoring-breakdown)
  - [HistogramTimeseries](https://docs.mux.com/api-reference/data#operation/get-monitoring-histogram-timeseries)
  - [Timeseries](https://docs.mux.com/api-reference/data#operation/get-monitoring-timeseries)
  """
  alias Mux.{Base, Fixtures}

  @doc """
  List of available real-time dimensions

  Returns `{:ok, dimensions, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, dimensions, _env} = Mux.Data.Monitoring.dimensions(client)
      iex> dimensions
      #{inspect(Fixtures.monitoring_dimensions()["data"])}

  """
  def dimensions(client) do
    Base.get(client, build_base_path() <> "/dimensions")
  end

  @doc """
  List of available real-time metrics

  Returns `{:ok, metrics, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, metrics, _env} = Mux.Data.Monitoring.metrics(client)
      iex> metrics
      #{inspect(Fixtures.monitoring_metrics()["data"])}

  """
  def metrics(client) do
    Base.get(client, build_base_path() <> "/metrics")
  end

  @doc """
  Get breakdown information for a specific dimension and metric along with the number of concurrent viewers and negative impact score.

  Returns `{:ok, breakdown, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, breakdown, _env} = Mux.Data.Monitoring.breakdown(client, "playback-failure-percentage", dimension: "country", timestamp: 1_547_853_000, filters: ["operating_system:windows"])
      iex> breakdown
      #{inspect(Fixtures.monitoring_breakdown()["data"])}

  """
  def breakdown(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/breakdown", query: params)
  end

  @doc """
  List histogram timeseries information for a specific metric

  Returns `{:ok, histogram_timeseries, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, histogram_timeseries, _env} = Mux.Data.Monitoring.histogram_timeseries(client, "video-startup-time", filters: ["operating_system:windows", "country:US"])
      iex> histogram_timeseries
      #{inspect(Fixtures.monitoring_histogram_timeseries()["data"])}

  """
  def histogram_timeseries(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/histogram-timeseries", query: params)
  end

  @doc """
  List timeseries information for a specific metric along with the number of concurrent viewers.

  Returns `{:ok, timeseries, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, timeseries, _env} = Mux.Data.Monitoring.timeseries(client, "playback-failure-percentage", filters: ["operating_system:windows", "country:US"])
      iex> timeseries
      #{inspect(Fixtures.monitoring_timeseries()["data"])}

  """
  def timeseries(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/timeseries", query: params)
  end

  defp build_base_path(), do: "/data/v1/monitoring"
  defp build_base_path(metric), do: build_base_path() <> "/metrics/#{metric}"
end
