defmodule Mux.Data.Metrics do
  @moduledoc """
  This module provides functions that interact with the `metrics` endpoints, which includes a bulk
  of the data product's statistical data.

  Note, these API documentation links may break periodically as we update documentation titles.
  - [Breakdowns](https://docs.mux.com/api-reference/data#operation/list-breakdown-values)
  - [Comparison](https://docs.mux.com/api-reference/data#operation/list-all-metric-values)
  - [Insights](https://docs.mux.com/api-reference/data#operation/list-insights)
  - [Overall](https://docs.mux.com/api-reference/data#operation/get-overall-values)
  - [Timeseries](https://docs.mux.com/api-reference/data#operation/get-metric-timeseries-data)
  """
  alias Mux.{Base, Fixtures}

  @doc """
  List the breakdown values for a specific metric.

  Returns `{:ok, breakdowns, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, breakdowns, _env} = Mux.Data.Metrics.breakdown(client, "video_startup_time", "browser")
      iex> breakdowns
      #{inspect(Fixtures.breakdown()["data"])}

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, breakdowns, _env} = Mux.Data.Metrics.breakdown(client, "video_startup_time", "browser", measurement: "median", timeframe: ["6:hours"])
      iex> breakdowns
      #{inspect(Fixtures.breakdown()["data"])}


  """
  def breakdown(client, metric, group_by, params \\ []) do
    params = Keyword.merge([group_by: group_by], params)
    Base.get(client, build_base_path(metric) <> "/breakdown", query: params)
  end

  @doc """
  List all of the values across every breakdown for a specific breakdown value.

  Returns `{:ok, comparisons, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, comparison, _env} = Mux.Data.Metrics.comparison(client, "browser", "Safari")
      iex> comparison
      #{inspect(Fixtures.comparison()["data"])}

  """
  def comparison(client, dimension, value, params \\ []) do
    params = Keyword.merge([dimension: dimension, value: value], params)
    Base.get(client, build_base_path() <> "/comparison", query: params)
  end

  @doc """
  Returns a list of insights for a metric. These are the worst performing values across all breakdowns
  sorted by how much they negatively impact a specific metric.

  Returns `{:ok, insights, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, insights, _env} = Mux.Data.Metrics.insights(client, "video_startup_time")
      iex> insights
      #{inspect(Fixtures.insights()["data"])}

  """
  def insights(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/insights", query: params)
  end

  @doc """
  Returns the overall value for a specific metric, as well as the total view count, watch time, and
  the Mux Global metric value for the metric.

  Returns `{:ok, overall_values, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, insights, _env} = Mux.Data.Metrics.overall(client, "video_startup_time")
      iex> insights
      #{inspect(Fixtures.overall()["data"])}

  """
  def overall(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/overall", query: params)
  end

  @doc """
  Returns time series data for a given metric.

  Returns `{:ok, timeseries, raw_env}`.

  ## Examples

      iex> client = Mux.client("my_token_id", "my_token_secret")
      iex> {:ok, timeseries, _env} = Mux.Data.Metrics.timeseries(client, "video_startup_time")
      iex> timeseries
      #{inspect(Fixtures.timeseries()["data"])}

  """
  def timeseries(client, metric, params \\ []) do
    Base.get(client, build_base_path(metric) <> "/timeseries", query: params)
  end

  defp build_base_path(), do: "/data/v1/metrics"
  defp build_base_path(metric), do: build_base_path() <> "/#{metric}"
end
