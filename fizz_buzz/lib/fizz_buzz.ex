defmodule FizzBuzz do
  def build(fileName) do
    # lendo o arquivo e mostrando no iex
    # file = File.read(fileName)
    # IO.inspect(file)

    # apresentando o arquivo no iex via pattern match
    # {:ok, file} = File.read(fileName)
    # file

    # tratando retornos do File.read com case
    # case File.read(fileName) do
    # {:ok, result} -> result
    # {:error, reason} -> reason
    # end

    # tratando retornos com sobrecarga
    # file = File.read(fileName)
    # handle_file_read(file)

    # utilizando o pipe operator
    fileName
    |> File.read()
    |> handle_file_read
  end

  defp handle_file_read({:ok, result}) do
    # list = String.split(result, ",")
    # Funcao anonima
    # Enum.map(list, fn number -> String.to_integer(number) end)
    # Enum.map(list, &String.to_integer/1)

    # utilizando o pipe operator
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_evaluate/1)
    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_evaluate(elem) do
    elem
    |> String.to_integer()
    |> evaluate()
  end

  defp evaluate(num) when rem(num, 3) == 0 and rem(num, 5) == 0, do: :fizzbuzz
  defp evaluate(num) when rem(num, 3) == 0, do: :fizz
  defp evaluate(num) when rem(num, 5) == 0, do: :buzz
  defp evaluate(num), do: num
end
