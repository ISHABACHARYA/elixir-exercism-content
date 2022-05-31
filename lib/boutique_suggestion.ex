defmodule BoutiqueSuggestions do
  def get_combinations(
        top_lists,
        bottom_lists,
        options \\ [maximum_price: 100]
      ) do
    for top <- top_lists,
        bottom <- bottom_lists,
        top.base_color !== bottom.base_color and options[:maximum_price] != nil and
          top.price + bottom.price <= options[:maximum_price] do
      {top, bottom}
    end
  end
end
