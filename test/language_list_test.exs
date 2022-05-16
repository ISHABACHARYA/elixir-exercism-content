defmodule LanguageListTest do
  use ExUnit.Case
  doctest LanguageList

  test "Create A new list with a language" do
    assert LanguageList.new() |> LanguageList.add("C") == ["C"]
  end

  test "Remove last item of list" do
    assert LanguageList.new() |> LanguageList.add("C") |> LanguageList.remove() == []
  end

  test " First Item of list" do
    assert LanguageList.new()
           |> LanguageList.add("C")
           |> LanguageList.add("D")
           |> LanguageList.first() == "C"
  end
end
