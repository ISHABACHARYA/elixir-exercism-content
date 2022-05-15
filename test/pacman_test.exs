defmodule PacmanTest do
  use ExUnit.Case
  doctest Rules

  test "For pacman score" do
    assert Rules.score?(true, false) == true
  end

  test "for pacman loses the game" do
    assert Rules.lose?(false, true) == true
  end

  test "for pacman wins" do
    assert Rules.win?(true, true, false) == true
  end
end
