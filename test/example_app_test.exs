defmodule CatapultTest do
  use ExUnit.Case
  doctest Catapult

  test "greets the world" do
    assert Catapult.hello() == :world
  end
end
