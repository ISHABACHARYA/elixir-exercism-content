defmodule Rules do
  @moduledoc """
  This is a module that defines the rules for pacman game.
  """
  @doc """
  Either the pacman eats the ghost or not
  """
  def eats_ghost?(power_pallet_active, touching_ghost), do: power_pallet_active && touching_ghost

  @doc """
  Either the pacman scores the point
  """
  def score?(power_pallet_active, touching_dot), do: power_pallet_active || touching_dot

  @doc """
  Condition to lose the game
  """
  def lose?(power_pallet_active, touching_ghost),
    do: !power_pallet_active && touching_ghost

  @doc """
  Condition for pacman to win the game
  """
  def win?(eaten_all_dots, power_pallet_active, touching_ghost),
    do: eaten_all_dots && !lose?(power_pallet_active, touching_ghost)
end
