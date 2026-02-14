defmodule BirdCount do
  def today(list) when list == [], do: nil
  def today(list) do
    [head | _] = list
    head
  end

  def increment_day_count(list) when list == [], do: [1]
  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) when list == [], do: false
  def has_day_without_birds?(list) do
    [head | tail] = list
    cond do
      head == 0 -> true
      head > 0 -> has_day_without_birds?(tail)
    end
  end

  def total(list) when list == [], do: 0
  def total(list) do
    [head | tail] = list
    head + total(tail)
  end

  def busy_days(list) when list == [], do: 0
  def busy_days(list) do
    [head | tail] = list
    cond do
      head >= 5 -> 1 + busy_days(tail)
      true -> busy_days(tail)
    end
  end
end
