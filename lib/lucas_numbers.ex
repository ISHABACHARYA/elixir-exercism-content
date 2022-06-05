defmodule LucasNumbers do
  def generate(count) when count == 1, do: [2]
  def generate(count) when count == 2, do: [2, 1]

  def generate(count) when is_integer(count) and count > 2 do
    seq =
      {2, 1}
      |> Stream.iterate(fn {n1, n0} -> {n0, n1 + n0} end)
      |> Stream.map(&elem(&1, 1))
      |> Enum.take(count - 1)

    [2 | seq]
  end

  def generate(_), do: raise(ArgumentError, "count must be specified as an integer >= 1")
end
