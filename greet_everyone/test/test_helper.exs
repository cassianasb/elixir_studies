ExUnit.start()

defmodule ExampleTest do
#   use ExUnit.Case
#   doctest GreetEveryone

#   test "greets the world" do
#     assert GreetEveryone.hello() == :world
#   end
  use ExUnit.Case
  doctest GreetEveryone

  setup_all do
    {:ok, recipient: :world}
  end

  test "greets", state do
    assert GreetEveryone.hello() == state[:recipient]
  end
end