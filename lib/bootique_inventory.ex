defmodule BoutiqueInventory do
  def sort_by_price([]), do: []

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn a -> a.price end, :asc)
  end

  @spec with_missing_price([atom | %{:price => any, optional(any) => any}]) :: []
  def with_missing_price([]), do: []

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x.price == nil end)
  end

  def update_names([], _, _), do: []

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      new_name = String.replace(item.name, old_word, new_word)
      Map.update(item, :name, old_word, fn _x -> new_name end)
    end)
  end

  def increase_quantity(item, qty) do
    updated_quantity =
      Enum.map(item.quantity_by_size, fn {i, j} -> {i, j + qty} end)
      |> Enum.into(%{}, fn {i, j} -> {i, j} end)

    Map.put(item, :quantity_by_size, updated_quantity)
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, quantity}, total -> total + quantity end)
  end
end
