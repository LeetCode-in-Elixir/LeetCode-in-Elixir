# #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
# #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
# #Udemy_2D_Arrays/Matrix #Big_O_Time_O(endRow+endCol)_Space_O(1)
# #2024_08_02_Time_253_ms_(100.00%)_Space_74_MB_(100.00%)

defmodule Solution do
  @spec search_matrix(matrix :: [[integer]], target :: integer) :: boolean
  def search_matrix(matrix, target) do
    matrix = matrix |> Enum.map(&List.to_tuple/1) |> List.to_tuple()
    binary_search(matrix, 0, tuple_size(matrix) * tuple_size(elem(matrix, 0)) - 1, target)
  end

  defp binary_search(_matrix, left, right, _target) when left > right, do: false

  defp binary_search(matrix, left, right, target) do
    mid = div(right + left, 2)
    cols = matrix |> elem(0) |> tuple_size()
    mid_elem = matrix |> elem(div(mid, cols)) |> elem(rem(mid, cols))

    cond do
      mid_elem > target -> binary_search(matrix, left, right - 1, target)
      mid_elem < target -> binary_search(matrix, mid + 1, right, target)
      mid_elem == target -> true
    end
  end
end