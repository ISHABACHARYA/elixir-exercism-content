defmodule KitchenCalculatorTest do
  use ExUnit.Case
  doctest KitchenCalculator

  test "returning exact value" do
    assert KitchenCalculator.get_volume({:mililiter, 200}) == 200
  end

  test "converting teaspoon to ml" do
    assert KitchenCalculator.to_milliliter({:tablespoon, 10}) == {:milliliter, 150}
  end
end
