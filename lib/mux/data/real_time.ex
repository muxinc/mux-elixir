defmodule Mux.Data.RealTime do
  @moduledoc """
  This module provides functions that interact with the `real-time` endpoints

  Note, these API documentation links may break periodically as we update documentation titles.
  - [Dimensions](https://api-docs.mux.com/#real-time-get)
  - [Metrics](https://api-docs.mux.com/#real-time-get-1)
  - [Breakdown](https://api-docs.mux.com/#real-time-get-2)
  - [HistogramTimeseries](https://api-docs.mux.com/#real-time-get-3)
  - [Timeseries](https://api-docs.mux.com/#real-time-get-4)
  """
  alias Mux.{Base, Fixtures}

  @doc """
  List of available real-time dimensions

  Returns `{:ok, raw_env | dimensions}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: dimensions} = _env} = Mux.Data.RealTime.dimensions(client)
      iex> dimensions
      #{inspect(Fixtures.realtime_dimensions()["data"])}

  """
  def dimensions(client) do
    Base.get(client, build_base_path() <> "/dimensions")
  end

  @doc """
  List of available real-time metrics

  Returns `{:ok, raw_env | metrics}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: metrics} = _env} = Mux.Data.RealTime.metrics(client)
      iex> metrics
      #{inspect(Fixtures.realtime_metrics()["data"])}

  """
  def metrics(client) do
    Base.get(client, build_base_path() <> "/metrics")
  end

  @doc """
  Get breakdown information for a specific dimension and metric along with the number of concurrent viewers and negative impact score.

  Returns `{:ok, raw_env | breakdown}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: breakdown} = _env} = Mux.Data.RealTime.breakdown(client, "playback-failure-percentage", dimension: "country", timestamp: 1_547_853_000, filters: ["operating_system:windows"])
      iex> breakdown
      #{inspect(Fixtures.realtime_breakdown()["data"])}

  """
  def breakdown(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/breakdown", query: params)
  end

  @doc """
  List histogram timeseries information for a specific metric

  Returns `{:ok, raw_env | histogram_timeseries}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: histogram_timeseries} = _env} = Mux.Data.RealTime.histogram_timeseries(client, "video-startup-time", filters: ["operating_system:windows", "country:US"])
      iex> histogram_timeseries
      #{inspect(Fixtures.realtime_histogram_timeseries()["data"])}

  """
  def histogram_timeseries(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/histogram-timeseries", query: params)
  end

  @doc """
  List timeseries information for a specific metric along with the number of concurrent viewers.

  Returns `{:ok, raw_env | timeseries}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, %{clean_body: timeseries} = _env} = Mux.Data.RealTime.timeseries(client, "playback-failure-percentage", filters: ["operating_system:windows", "country:US"])
      iex> timeseries
      #{inspect(Fixtures.realtime_timeseries()["data"])}

  """
  def timeseries(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/timeseries", query: params)
  end

  defp build_base_path(), do: "/data/v1/realtime"
  defp build_base_path(metric), do: build_base_path() <> "/metrics/#{metric}"
end
