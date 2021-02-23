defmodule Exmon do
  alias Exmon.{Player, Game}
  alias Exmon.Game.Status

  @computer_name "Marvin"

  def create_player(moveAvg, moveHeal, moveRnd, name) do
    Player.build(moveAvg, moveHeal, moveRnd, name)
  end

  def new_player do
    create_player(:voadora, :cura, :bicuda, "Duuuude")
  end

  def start_game(player) do
    :punch
    |> create_player(:heal, :kick, @computer_name)
    |> Game.start(player)

    Status.print_round_message()
  end

end
