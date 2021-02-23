defmodule GreetEveryone do
 @moduledoc """
 Documentation for `GreetEveryone`.
 """

 @doc """
 Hello world.

  # Examples

     iex> GreetEveryone.hello()
     :world

 """
  @spec hello() :: String.t()
 def hello do
   :world
  end
end

defmodule Greeter do
  @moduledoc """
  ...
  """

  @doc """
  Prints a hello message

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

      iex> Greeter.hello("Sean")
      "Hello, Sean"

      iex> Greeter.hello("pete")
      "Hello, pete"

  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end

 @doc """
 Hello world.

  # Examples

     iex> GreetEveryone.hello()
     :world

 """
  @spec hello() :: String.t()
 def hello do
   :world
  end
end