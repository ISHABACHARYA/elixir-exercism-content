defmodule Lasagna do
  @moduledoc """
  It estimates the time of preparation of lasagna
  """
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(time_spent) do
    40 - time_spent
  end

  def preparation_time_in_minutes(layer_numbers) do
    layer_numbers * 2
  end

  def total_time_in_minutes(time_spent, layer_numbers) do
    layer_numbers * 2 + time_spent
  end

  def alarm do
    "Ding!"
  end
end
