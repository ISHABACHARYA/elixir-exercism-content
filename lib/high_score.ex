defmodule HighScore do
  @initial_score 0
  def new, do: %{}

  def add_player(player_list, name, score \\ @initial_score) do
    Map.put(player_list, name, score)
  end

  def remove_player(player_list, name) do
    Map.delete(player_list, name)
  end

  def reset_score(player_list, name) do
    Map.put(player_list, name, @initial_score)
  end

  def update_score(player_list, name, score) do
    Map.update(player_list, name, score, fn s -> s + score end)
  end

  def get_players(player_list) do
    Map.keys(player_list)
  end
end
