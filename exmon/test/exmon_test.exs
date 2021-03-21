defmodule ExmonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Exmon

  alias Exmon.Player

  describe "create_player/4" do
    test "return a player" do
      expected_response = %Player{
        life: 100,
        moves: %{
          move_avg: "Cassiana",
          move_heal: :voadora,
          move_rnd: :bicuda
        },
        name: :cura
      }
      assert expected_response == Exmon.create_player("Cassiana", :voadora, :bicuda, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build(:voadora, :cura, :bicuda, "Cassiana")

      messages =
        capture_io(fn ->
          assert Exmon.start_game(player) == :ok
        end)
      assert messages =~ "The game is on!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build(:voadora, :cura, :bicuda, "Cassiana")

      capture_io( fn ->
        Exmon.start_game(player)
      end)

      :ok
    end
    test "when the move is valid, do the move and the computer makes a move" do


      messages =
      capture_io( fn ->
        Exmon.make_move(:voadora)
      end)
      assert messages =~ "The Player attacked the Computer"
      assert messages =~ "It's computer turn."
      assert messages =~ "It's player turn."
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, return an error message" do
      messages =
      capture_io( fn ->
        Exmon.make_move(:teste)
      end)
      assert messages =~ "Invalid move:"
    end
  end

  # TODO: tests with game_over
end
