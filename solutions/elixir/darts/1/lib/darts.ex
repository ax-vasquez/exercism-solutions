defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    x_sq = Float.pow(x * 1.0, 2)
    y_sq = Float.pow(y * 1.0, 2)
    cond do
      x_sq + y_sq <= 1 -> 10
      x_sq + y_sq <= 25 -> 5
      x_sq + y_sq <= 100 -> 1
      true -> 0
    end
  end
end
