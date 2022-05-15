defmodule FreelancerTest do
  use ExUnit.Case
  doctest FreelancerRates

  test "testing freelancer daily rate" do
    assert FreelancerRates.daily_rate(20) == 160
  end

  test "total  price with discount" do
    assert FreelancerRates.apply_discount(1800, 10) == 1620
  end

  test "total monthly price with discount" do
    assert FreelancerRates.monthly_rate(20, 10) == 3168
  end
end
