defmodule BikeMaker.WheelServerTest do
  use ExUnit.Case

  alias BikeMaker.WheelServer

  describe "add_data/1" do
    test "adds data sucessfuly to the wheel" do
      {:ok, pid} = WheelServer.start_link()

      assert WheelServer.add_data(pid, :rim, 2.3) == :ok
    end
  end

  describe "get_data/1" do
    test "gets data from the wheel" do
      {:ok, pid} = WheelServer.start_link()

      WheelServer.add_data(pid, :tire, 7.8)

      assert WheelServer.get_data(pid, :tire) == 7.8
    end
  end

  describe "get_diameter/1" do
    {:ok, pid} = WheelServer.start_link()

    WheelServer.add_data(pid, :tire, 6.6)
    WheelServer.add_data(pid, :rim, 2.4)

    assert WheelServer.get_diameter(pid) == 15.6
  end
end
