defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) when Kernel.elem(volume_pair, 0) == :cup, do: {:milliliter, Kernel.elem(volume_pair, 1) * 240}
  def to_milliliter(volume_pair) when Kernel.elem(volume_pair, 0) == :fluid_ounce, do: {:milliliter, Kernel.elem(volume_pair, 1) * 30}
  def to_milliliter(volume_pair) when Kernel.elem(volume_pair, 0) == :teaspoon, do: {:milliliter, Kernel.elem(volume_pair, 1) * 5}
  def to_milliliter(volume_pair) when Kernel.elem(volume_pair, 0) == :tablespoon, do: {:milliliter, Kernel.elem(volume_pair, 1) * 15}
  def to_milliliter(volume_pair) when Kernel.elem(volume_pair, 0) == :milliliter, do: {:milliliter, Kernel.elem(volume_pair, 1)}

  def from_milliliter(volume_pair, unit) when unit == :cup, do: {unit, Kernel.elem(volume_pair, 1) / 240}
  def from_milliliter(volume_pair, unit) when unit == :fluid_ounce, do: {unit, Kernel.elem(volume_pair, 1) / 30}
  def from_milliliter(volume_pair, unit) when unit == :teaspoon, do: {unit, Kernel.elem(volume_pair, 1) / 5}
  def from_milliliter(volume_pair, unit) when unit == :tablespoon, do: {unit, Kernel.elem(volume_pair, 1) / 15}
  def from_milliliter(volume_pair, unit) when unit == :milliliter, do: {unit, Kernel.elem(volume_pair, 1)}

  def convert(volume_pair, unit) when unit == :milliliter, do: to_milliliter(volume_pair)
  def convert(volume_pair, unit) when unit != :milliliter, do: from_milliliter(to_milliliter(volume_pair), unit)
end
