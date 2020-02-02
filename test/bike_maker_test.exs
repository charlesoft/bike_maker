defmodule BikeMakerTest do
  use ExUnit.Case
  doctest BikeMaker

  test "greets the world" do
    assert BikeMaker.hello() == :world
  end
end
