# #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
# #Binary_Search_I_Day_2 #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
# #2024_08_02_Time_228_ms_(100.00%)_Space_76.9_MB_(40.00%)

defmodule Solution do
  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    search_insert(nums, target, 0, length(nums) - 1)
  end

  defp search_insert(nums, target, lo, hi) when lo <= hi do
    mid = div(lo + hi, 2)

    cond do
      target == Enum.at(nums, mid) ->
        mid

      target < Enum.at(nums, mid) ->
        search_insert(nums, target, lo, mid - 1)

      target > Enum.at(nums, mid) ->
        search_insert(nums, target, mid + 1, hi)
    end
  end

  defp search_insert(_, _, lo, _) do
    lo
  end
end
