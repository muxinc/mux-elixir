defmodule Mux.Video.DeliveryUsage do
  @moduledoc """
  This module provides functions for reading delivery usage in Mux Video. [API Documentation](https://docs.mux.com/reference#delivery-usage)
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/delivery-usage"

  @doc """
  Get delivery usage for a specified timeframe.

  Returns `{:ok, delivery_usage, %Tesla.Env{}}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, delivery_usage, _env} = Mux.Video.DeliveryUsage.list(client, %{timeframe: [1564617600, 1569283200]})
      iex> delivery_usage
      #{inspect([Fixtures.delivery_usage(), Fixtures.delivery_usage()])}
  """

  def list(client, options \\ []) do
    Base.get(client, @path, query: options)
  end
end
