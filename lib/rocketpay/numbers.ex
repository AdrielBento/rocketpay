defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    File.read("#{filename}.csv")
    |> handle_file()
  end

  defp handle_file({:ok, data}) do
    total =
      String.split(data, ",", trim: true)
      |> Stream.map(fn x -> String.to_integer(x) end)
      |> Enum.sum()

    {:ok, %{result: total}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Error"}}
end
