defmodule MuxTest do
  use ExUnit.Case
  doctest Mux

  test "creates a new connection client" do
    client = Mux.client("abcd", "abcd1234")
    assert %Tesla.Client{} = client
  end
end
