defmodule HighSchoolSweetHeartTest do
  use ExUnit.Case
  doctest HighSchoolSweetheart

  test "initial of name" do
    assert HighSchoolSweetheart.first_letter("rabin") == "r"
  end
end
