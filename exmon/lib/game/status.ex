defmodule Exmon.Game.Status do

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n-------------------------------------------\n")
    IO.puts("===== The game is on! =====")
    IO.inspect(info)
    IO.puts("\n-------------------------------------------")
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== It's #{player} turn. =====")
    IO.inspect(info)
    IO.puts("\n-------------------------------------------")
  end
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n===== The game is over. =====")
    IO.inspect(info)
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

  def print_move_message(player, :heal, life) do
    IO.puts("===== The #{player} healed itself to #{life} life points. =====\n")
  end
end
