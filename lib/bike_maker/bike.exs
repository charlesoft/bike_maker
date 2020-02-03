defmodule BikeMaker.Bike do
  alias BikeMaker.{Gear, Wheel}

  defstruct [:wheels, :gears]

  @type :: t %__MODULE__{
    wheels: [Wheel.t()],
    gear: [Gear.t()]
  }
end
