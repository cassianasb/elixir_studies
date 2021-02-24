defmodule Exmon do
  alias Exmon.{Player, Game}
  alias Exmon.Game.{Status, Actions}

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

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "realiza_cura"
      move -> Actions.attack(move)
    end
  end
end
