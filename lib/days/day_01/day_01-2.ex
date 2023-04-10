defmodule ElixirAoc2022.Day01.Part2 do
  defp read do
    File.read!(File.cwd!() <> "/lib/days/day_01/input.txt")
  end

  defp string_to_integer(str) do
    parse_result = Integer.parse(str)

    cond do
      is_tuple(parse_result) ->
        elem(parse_result, 0)

      true ->
        0
    end
  end

  def get_summed_entries do
    input = read()

    input
    |> String.split("\n")
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.flat_map(fn x ->
      if x === [""],
        do: [],
        else: [
          Enum.map(x, &string_to_integer(&1)) |> Enum.sum()
        ]
    end)
  end

  def solve_part_1 do
    get_summed_entries()
    |> Enum.max()
  end

  def solve_part_2 do
    get_summed_entries() |> Enum.sort(&(&1 >= &2)) |> Enum.slice(0..2) |> Enum.sum()
  end
end
