defmodule RabbitmqSingleQueueExampleElixirTest do
  use ExUnit.Case
  doctest RabbitmqSingleQueueExampleElixir

  test "greets the world" do
    assert RabbitmqSingleQueueExampleElixir.hello() == :world
  end
end
