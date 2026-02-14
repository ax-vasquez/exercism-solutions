defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) when guess == :no_guess, do: "Make a guess"
  def compare(secret_number, guess) when guess == secret_number, do: "Correct"
  def compare(secret_number, guess) when guess >= (secret_number + 2), do: "Too high"
  def compare(secret_number, guess) when guess <= (secret_number - 2), do: "Too low"
  # Other conditions should fire before this, otherwise this will fail the Too low/high tests if run earlier
  def compare(secret_number, guess) when guess > secret_number or guess < secret_number, do: "So close"
end
