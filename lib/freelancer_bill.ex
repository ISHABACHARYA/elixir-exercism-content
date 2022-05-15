defmodule FreelancerRates do
  @moduledoc """
  It caluclate the total biling amount of freelancer
  """
  @daily_rate_times_hourly 8.0
  @billable_days 22.0
  def daily_rate(hourly_rate), do: hourly_rate * @daily_rate_times_hourly

  def apply_discount(total_price, discount_rate),
    do: (1 - discount_rate / 100) * total_price

  def monthly_rate(hourly_rate, discount_rate),
    do:
      (daily_rate(hourly_rate) * @billable_days)
      |> apply_discount(discount_rate)
      |> Float.ceil()
      |> round

  def days_in_budget(budget, hourly_rate, discount) do
    (budget /
       (daily_rate(hourly_rate)
        |> apply_discount(discount)))
    |> Float.floor(1)
  end
end
