defmodule Exmon.GameTest do
  use ExUnit.Case

  alias Exmon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build(:voadora, :cura, :bicuda, "Cassiana")
      computer = Player.build(:voadora, :cura, :bicuda, "Marvin")

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build(:voadora, :cura, :bicuda, "Cassiana")
      computer = Player.build(:voadora, :cura, :bicuda, "Marvin")

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
        life: 100,
        moves: %{
          move_avg: :voadora,
          move_heal: :cura,
          move_rnd: :bicuda
        },
        name: "Marvin"
      },
      player: %Player{
        life: 100,
        moves: %{
          move_avg: :voadora,
          move_heal: :cura,
          move_rnd: :bicuda
        },
        name: "Cassiana"
      },
      status: :started,
      turn: :player
    }
      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build(:voadora, :cura, :bicuda, "Cassiana")
      computer = Player.build(:voadora, :cura, :bicuda, "Marvin")

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Marvin"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Cassiana"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Marvin"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Cassiana"
        },
        status: :started,
        turn: :player
      }

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Marvin"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :voadora,
            move_heal: :cura,
            move_rnd: :bicuda
          },
          name: "Cassiana"
        },
        status: :continue,
        turn: :computer
      }

      Game.update(new_state)
      assert expected_response == Game.info()
    end
  end
  # TODO: tests with player and turn
end
