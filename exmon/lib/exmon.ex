defmodule Exmon do
  alias Exmon.{Player, Game}
  alias Exmon.Game.{Status, Actions}

  @computer_name "Marvin"
  @computer_moves [:move_avg, :move_rnd, :move_heal]

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

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())

  defp handle_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end
  defp computer_move(_), do: :ok
end
