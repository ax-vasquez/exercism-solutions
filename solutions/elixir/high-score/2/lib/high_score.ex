defmodule HighScore do
  @base_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @base_score)
  def add_player(scores, name, score) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.drop(scores, [name])
  end

  def reset_score(scores, name) do
    cond do
      Map.get(scores, name) == nil -> add_player(scores, name)
      true -> Map.replace(scores, name, @base_score)
    end
  end

  def update_score(scores, name, score) do
    cond do
      Map.get(scores, name) == nil -> add_player(scores, name, score)
      true -> Map.update!(scores, name, &(&1 + score))
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
