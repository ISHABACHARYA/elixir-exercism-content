defmodule LasagnaTest do
  use ExUnit.Case
  doctest Lasagna

  test "total time to prepare lasagna" do
    assert Lasagna.expected_minutes_in_oven() == 40
  end
end
