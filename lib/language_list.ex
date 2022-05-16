defmodule LanguageList do
  @moduledoc """
  A list of languages and various operations to perform on the list
  """
  @language1 "Elixir"
  def new, do: []

  def add(language_list, new_language), do: [new_language | language_list]

  def remove(language_list), do: tl(language_list)

  def first(language_list), do: hd(language_list)

  def count(language_list), do: length(language_list)

  def functional_list?(language_list), do: @language1 in language_list
end
