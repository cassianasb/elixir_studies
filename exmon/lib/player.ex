defmodule Exmon.Player do
  @requiredKeys [:life, :moves, :name]
  @enforce_keys @requiredKeys
  defstruct @requiredKeys

  @maxLife 100

  def build(move_avg, move_heal, move_rnd, name) do
    %Exmon.Player{
      life: @maxLife,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd,
      },
      name: name
    }
  end
end
