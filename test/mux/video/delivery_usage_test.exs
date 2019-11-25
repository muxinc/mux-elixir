defmodule Mux.Video.DeliveryUsageTest do
  use ExUnit.Case
  import Tesla.Mock
  doctest Mux.Video.DeliveryUsage

  @base_url "https://api.mux.com/video/v1/delivery-usage"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url, query: %{timeframe: [1_564_617_600, 1_569_283_200]}} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [Mux.Fixtures.delivery_usage(), Mux.Fixtures.delivery_usage()]
          }
        }
    end)

    {:ok, %{client: client}}
  end
end
