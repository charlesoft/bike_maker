defmodule BikeMaker.Wheel do
  defstruct [:rim, :tire]

  @type t :: %__MODULE__{
    rim: Float.t(),
    tire: Float.t()
  }

  def build(%{rim: rim, tire: tire}) do
    %__MODULE__{
      rim: rim,
      tire: tire
    }
  end

  def add(%__MODULE__{} = wheel, :rim, rim) do
    Map.replace!(wheel, :rim, rim)
  end

  def add(%__MODULE__{} = wheel, :tire, rim) do
    Map.replace!(wheel, :tire, rim)
  end

  def get(%__MODULE__{} = wheel, :rim), do: Map.get(wheel, :rim)

  def get(%__MODULE__{} = wheel, :tire), do: Map.get(wheel, :tire)

  def diameter(%__MODULE__{rim: rim, tire: tire}) do
    rim + (tire * 2)
  end
end
