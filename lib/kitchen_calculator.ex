defmodule KitchenCalculator do
  @moduledoc """
  come up with a way to convert common US baking measurements to milliliters (mL) for your own ease.
  """
  @metric_systems %{milliliter: 1, cup: 240, fluid_ounce: 30, teaspoon: 5, tablespoon: 15}
  def get_volume({_metrics, volume}), do: volume

  def to_milliliter({metrics, volume}) do
    {:milliliter, volume * @metric_systems[metrics]}
  end

  def from_milliliter({_, volume}, metrics) do
    {metrics, volume / @metric_systems[metrics]}
  end

  def convert(volume_pair, to_metrics) do
    to_milliliter(volume_pair) |> from_milliliter(to_metrics)
  end
end
