defmodule GuessingGame do
  @moduledoc """
  Trivial online game and give some feedback on the guess
  """
  @response %{
    matches: "Correct",
    one_more_or_less: "So close",
    greater: "Too high",
    lesser: "Too low",
    no_guess: "Make a guess"
  }

  def compare(a, b \\ :no_guess)
  def compare(a, b) when a == b, do: @response.matches
  def compare(a, b) when abs(a - b) == 1, do: @response.one_more_or_less
  def compare(a, b) when a - b > 1, do: @response.lesser
  def compare(a, b) when b - a > 1, do: @response.greater
  def compare(_a, :no_guess), do: @response.no_guess
end
