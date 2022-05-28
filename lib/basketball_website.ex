defmodule BasketballWebsite do
  defp do_extract(_data, []), do: nil
  defp do_extract(data, [path]), do: data[path]
  defp do_extract(data, [head | tail]), do: do_extract(data[head], tail)

  def extract_from_path(data, path) do
    split = String.split(path, ".")
    do_extract(data, split)
  end

  def get_in_path(data, path) do
    split = String.split(path, ".")
    get_in(data, split)
  end
end
