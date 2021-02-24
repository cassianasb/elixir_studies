defmodule Exmon.Game.Status do
  alias Exmon.Game
  def print_round_message do
    IO.puts("\n-------------------------------------------\n")
    IO.puts("===== The game is on! =====")
    IO.inspect(Game.info())
    IO.puts("\n-------------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("===== Invalid move: #{move} =====")
  end
end
