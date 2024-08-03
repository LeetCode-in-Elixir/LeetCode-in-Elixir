# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
# #Algorithm_II_Day_11_Recursion_Backtracking #Big_O_Time_O(4^(m*n))_Space_O(m*n)
# #2024_08_03_Time_1312_ms_(100.00%)_Space_71.1_MB_(100.00%)

defmodule Solution do
  @spec exist(board :: [[char]], word :: String.t) :: boolean
  def exist(board, word) do
    board =
      board
      |> Enum.map(&List.to_tuple/1)
      |> List.to_tuple()

    w = tuple_size(board) - 1
    h = tuple_size(elem(board, 0)) - 1

    for i <- 0..w, j <- 0..h, reduce: false do
      found -> found || find(board, word, i, j, w, h, [])
    end
  end

  defp find(_board, "", _i, _j, _w, _h, _visited), do: true

  defp find(board, <<char, rest::binary>>, i, j, w, h, visited) do
    cond do
      i < 0 -> false
      i > w -> false
      j < 0 -> false
      j > h -> false
      elem(elem(board, i), j) != char -> false
      {i, j} in visited -> false

      true ->
        visited = [{i, j} | visited]
        find(board, rest, i - 1, j, w, h, visited) ||
        find(board, rest, i + 1, j, w, h, visited) ||
        find(board, rest, i, j - 1, w, h, visited) ||
        find(board, rest, i, j + 1, w, h, visited)
    end
  end
end
