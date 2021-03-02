defmodule Exmon.Game.Actions.Attack do
  alias Exmon.Game

  # x..y = range de x a y
  @move_avg_power 18..25
  @move_rnd_power 10..35

   def attack_opponent(opponent, move) do
    damage = calculate_power(move)
    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_life_opponent(opponent)
    |> update_game(opponent)
   end

   defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
   defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

   defp calculate_total_life(life, damage) when life - damage < 0, do: 0
   defp calculate_total_life(life, damage), do: life - damage

   defp update_life_opponent(life, opponent) do
     opponent
     |> Game.fetch_player()
     |> Map.put(:life, life)
   end

   def update_game(player, opponent) do
     Game.info()
     |> Map.put(opponent, player)
     |> Game.update()
   end
end
