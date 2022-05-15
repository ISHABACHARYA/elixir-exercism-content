defmodule SecretsTests do
  use ExUnit.Case
  doctest Secrets

  test "secret add" do
    adder = Secrets.secret_add(2)
    assert adder.(2) === 4
  end

  test "secret substract" do
    substract = Secrets.secret_substract(2)
    assert substract.(2) === 0
  end

  test "secret multiply" do
    multiply = Secrets.secret_multiply(2)
    assert multiply.(2) === 4
  end

  test "secret bitwise and" do
    bitwiseAnd = Secrets.secret_and(3)
    assert bitwiseAnd.(2) === 2
  end

  test "secret function combiner" do
    multiply = Secrets.secret_multiply(7)
    divide = Secrets.secret_divide(3)
    combined = Secrets.secret_combine(multiply, divide)
    assert round(combined.(6)) === 14
  end
end
