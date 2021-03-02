defmodule Exmon.Game.Status do
  alias Exmon.Game
  def print_round_message do
    IO.puts("\n-------------------------------------------\n")
    IO.puts("===== The game is on! =====")
    IO.inspect(Game.info())
    IO.puts("\n-------------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("===== Invalid move: #{move} =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("===== The Player attacked the Computer dealing #{damage} damage. =====\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("===== The Computer attacked the Player dealing #{damage} damage. =====\n")
  end
end
