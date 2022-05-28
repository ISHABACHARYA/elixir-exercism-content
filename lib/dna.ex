defmodule DNA do
  @nucleac_acid_code %{?\s => 0b0000, ?A => 0b0001, ?C => 0b0010, ?G => 0b0100, ?T => 0b1000}
  @nucleac_acid_decode Enum.map(@nucleac_acid_code, fn {k, v} -> {v, k} end) |> Map.new()

  def encode_nucleotide(code) do
    @nucleac_acid_code[code]
  end

  def decode_nucleotide(code), do: @nucleac_acid_decode[code]
  def encode([]), do: <<>>

  def encode([head | tail]) do
    <<encode_nucleotide(head)::4, encode(tail)::bitstring>>
  end

  def decode(dna)
  def decode(<<>>), do: []

  def decode(<<head::4, tail::bitstring>>) do
    [decode_nucleotide(head) | decode(tail)]
  end
end
