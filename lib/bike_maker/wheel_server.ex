defmodule BikeMaker.WheelServer do
  use GenServer

  alias BikeMaker.Wheel

  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  def add_data(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get_data(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def get_diameter(pid) do
    GenServer.call(pid, :diameter)
  end

  @impl GenServer
  def init(_) do
    {:ok, BikeMaker.Wheel.build(%{rim: nil, tire: nil})}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, wheel) do
    updated_wheel = Wheel.add(wheel, key, value)

    {:noreply, updated_wheel}
  end

  @impl GenServer
  def handle_call({:get, key}, _, wheel) do
    {:reply, Wheel.get(wheel, key), wheel}
  end

  def handle_call(:diameter, _, wheel) do
    {:reply, Wheel.diameter(wheel), wheel}
  end
end
