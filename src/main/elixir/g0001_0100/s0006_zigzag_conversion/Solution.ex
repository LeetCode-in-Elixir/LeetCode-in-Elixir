# #Medium #String #Top_Interview_150_Array/String
# #2024_07_31_Time_421_ms_(100.00%)_Space_73.2_MB_(100.00%)

defmodule Solution do
  @spec convert(s :: String.t, num_rows :: integer) :: String.t
  def convert(s, 1), do: s
  def convert(s, num_rows) do
    String.codepoints(s)
    |> read(%{}, 0, 1, num_rows)
    |> then(fn map ->
      Enum.flat_map(0..num_rows - 1, fn i ->
        Map.get(map, i, [])
        |> Enum.reverse()
      end)
    end)
    |> to_string()
  end

  defp read([], map, _, _, _), do: map
  defp read(s, map, -1, _, num_rows) do
    read(s, map, 1, 1, num_rows)
  end
  defp read(s, map, num_rows, _, num_rows) do
    read(s, map, num_rows - 2, -1, num_rows)
  end
  defp read([ch | s], map, i, add, num_rows) do
    map = Map.update(map, i, [ch], &([ch | &1]))
    read(s, map, i + add, add, num_rows)
  end
end
