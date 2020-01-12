defmodule ScatterTest do
  use ExUnit.Case
  doctest Scatter

  test "greets the world" do
    assert Scatter.hello() == :world
  end
end
