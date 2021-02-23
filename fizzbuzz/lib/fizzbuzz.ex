defmodule Fizzbuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read
  end

  def handle_file_read({:ok, result}) do
    result =
    result
    |>String.split(",")
    |> Enum.map(&fizzbuzz/1)

    {:ok, result}
  end

  def handle_file_read({:error, reason}), do: {:error, "Error! Reason: #{reason}"}

  def witchfizz(0, 0, _), do: "FizzBuzz"
  def witchfizz(0, _, _), do: "Fizz"
  def witchfizz(_, 0, _), do: "Buzz"
  def witchfizz(_, _, n), do: n

  # witchfizz = fn
  #   (0, 0, _) -> "FizzBuzz"
  #   (0, _, _) -> "Fizz"
  #   (_, 0, _) -> "Buzz"
  #   (_, _, n) -> n
  # end

  defp fizzbuzz(n) do
    nint=String.to_integer(n)
    witchfizz(rem(nint, 3), rem(nint, 5), nint)
  end

  #fizzbuzz = fn (n) ->
  #  witchfizz.(rem(n, 3), rem(n, 5), n)
  #end
end
