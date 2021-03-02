defmodule Exmon.Game.Actions.Attack do
  alias Exmon.Game
  alias Exmon.Game.Status

  # x..y = range de x a y
  @move_avg_power 18..25
  @move_rnd_power 10..35

   def attack_opponent(opponent, move) do
    damage = calculate_power(move)
    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_life_opponent(opponent, damage)
    |> update_game(opponent, damage)
   end

   defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
   defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

   defp calculate_total_life(life, damage) when life - damage < 0, do: 0
   defp calculate_total_life(life, damage), do: life - damage

   defp update_life_opponent(life, opponent, damage) do
     opponent
     |> Game.fetch_player()
     |> Map.put(:life, life)
   end

   def update_game(player, opponent, damage) do
     Game.info()
     |> Map.put(opponent, player)
     |> Game.update()

     Status.print_move_message(opponent, :attack, damage)
   end
end
