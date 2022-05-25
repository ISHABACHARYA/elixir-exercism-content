defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.at(0)
  end

  def initial(name) do
    up_letter = first_letter(name) |> String.upcase()
    up_letter <> "."
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name, " ")
    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(name1, name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(name1)}  +  #{initials(name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
