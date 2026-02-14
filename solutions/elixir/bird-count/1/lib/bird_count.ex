defmodule BirdCount do
  def today(list) when list == [], do: nil
  def today(list) do
    Enum.at(list, 0)
  end

  def increment_day_count(list) when list == [], do: [1]
  def increment_day_count(list) do
    [Enum.at(list, 0) + 1 | Kernel.tl(list)]
  end

  def has_day_without_birds?(list) do
    cond do
      list == [] -> false
      Enum.at(list, 0) == 0 -> true
      Enum.at(list, 0) > 0 -> has_day_without_birds?(Kernel.tl(list))
    end
  end

  def total(list) do
    cond do
      list == [] -> 0
      Enum.count(list) > 0 -> Enum.at(list, 0) + total(Kernel.tl(list))
    end
  end

  def busy_days(list) when list == [], do: 0
  def busy_days(list) do
    cond do
      Enum.at(list, 0) >= 5 -> 1 + busy_days(Kernel.tl(list))
      true -> busy_days(Kernel.tl(list))
    end
  end
end
