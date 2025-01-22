# #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
# #Dynamic_Programming_I_Day_16 #Udemy_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
# #2025_01_22_Time_3_(100.00%)_Space_89.73_(100.00%)

defmodule Solution do
  @spec min_path_sum(grid :: [[integer]]) :: integer
  def min_path_sum(grid) do
    grid_width = length(hd(grid)) # Determine the number of columns in the grid
    traverse(grid, [0 | List.duplicate(:infinity, grid_width - 1)])
  end

  defp traverse([], prev_row), do: Enum.at(prev_row, -1)
  defp traverse([[first | row] | rows], [prev_row_head | prev_row]) do
    prev_row = traverse_row(row, prev_row, [first + prev_row_head])
    traverse(rows, prev_row)
  end

  defp traverse_row([], _prev_row, acc), do: Enum.reverse(acc)
  defp traverse_row([head | tail], [top | prev_row], [prev | _rest] = acc) do
    traverse_row(tail, prev_row, [head + min(prev, top) | acc])
  end
end
