# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
# #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
# #Udemy_Famous_Algorithm #Big_O_Time_O(n)_Space_O(1)
# #2024_08_02_Time_920_ms_(100.00%)_Space_157.5_MB_(100.00%)

defmodule Solution do
  @spec max_sub_array(nums :: [integer]) :: integer
  def max_sub_array([h | t]) do
    solve(t, h, h)
  end

  defp solve([], curr_sum, max_sum), do: max(curr_sum, max_sum)

  defp solve(nums, curr_sum, max_sum) when curr_sum < 0 do
    solve(nums, 0, max_sum)
  end

  defp solve([h | t], curr_sum, max_sum) do
    curr_sum = curr_sum + h
    solve(t, curr_sum, max(curr_sum, max_sum))
  end
end