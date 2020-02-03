defmodule BikeMaker.WheelTest do
  use ExUnit.Case

  alias BikeMaker.Wheel

  describe "build/1" do
    test "builds a wheel struct" do
      data = %{rim: 1.8, tire: 2.3}

      assert Wheel.build(data) == %Wheel{rim: 1.8, tire: 2.3}
    end
  end
end
