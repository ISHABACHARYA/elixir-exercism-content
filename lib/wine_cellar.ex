defmodule WineCellar do
  @colors [
    white: "Fermented without skin contact.",
    red: "Fermented with skin contact using dark-colored grapes.",
    rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
  ]
  def explain_colors, do: @colors

  def filter(wine_list, color, options \\ []) do
    wines = Keyword.get_values(wine_list, color)
    year = Keyword.get(options, :year)
    country = Keyword.get(options, :country)
    wines = if year, do: filter_by_year(wines, year), else: wines
    if country, do: filter_by_country(wines, country), else: wines
  end

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
