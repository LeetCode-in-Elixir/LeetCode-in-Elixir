# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
# #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Big_O_Time_O(log_n)_Space_O(1)
# #2024_08_02_Time_1249_ms_(100.00%)_Space_110.3_MB_(100.00%)

defmodule Solution do
  @spec search_range(nums :: [integer], target :: integer) :: [integer]
  def search_range([], _), do: [-1, -1]
  def search_range(nums, target) do
    tuple = list_to_tuple(nums)
    left = find_left(tuple, 0, tuple_size(tuple) - 1, target)
    right = find_right(tuple, 0, tuple_size(tuple) - 1, target)
    [left, right]
  end

  defp find_left(nums, left, left, target), do: if elem(nums, left) == target, do: left, else: -1
  defp find_left(nums, left, right, target) do
    mid = left + div((right - left), 2)
    if (target <= elem(nums, mid)) do
      cond do
        elem(nums, left) == target -> left
        elem(nums, left) < target -> find_left(nums, left, mid, target)
        true -> -1
      end
    else
      find_left(nums, mid + 1, right, target)
    end
  end

  defp find_right(nums, right, right, target), do: if elem(nums, right) == target, do: right, else: -1
  defp find_right(nums, left, right, target) do
    mid = left + div((right - left + 1), 2) 
    if (target >= elem(nums, mid)) do
      cond do
        elem(nums, right) == target -> right
        elem(nums, right) > target -> find_right(nums, mid, right, target)
        true -> -1
      end
    else
      find_right(nums, left, mid - 1, target)
    end
  end

  defp list_to_tuple(list), do: list_to_tuple(list, {})
  defp list_to_tuple([], tuple), do: tuple
  defp list_to_tuple([x|xs], tuple), do: list_to_tuple(xs, Tuple.append(tuple, x))
end