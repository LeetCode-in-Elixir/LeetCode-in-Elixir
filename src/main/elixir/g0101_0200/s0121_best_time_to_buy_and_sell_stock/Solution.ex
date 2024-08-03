# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
# #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
# #Big_O_Time_O(N)_Space_O(1) #2024_08_03_Time_797_ms_(30.00%)_Space_131.8_MB_(30.00%)

defmodule Solution do
  @spec max_profit(prices :: [integer]) :: integer
  def max_profit(prices) do
    max_profit_helper(prices, 0, :math.pow(2, 63))
  end

  defp max_profit_helper([], max_so_far, _cur_min), do: max_so_far

  defp max_profit_helper([head | tail], max_so_far, cur_min) do
    new_max_so_far = if head - cur_min > max_so_far, do: head - cur_min, else: max_so_far
    new_cur_min = if head < cur_min, do: head, else: cur_min
    max_profit_helper(tail, new_max_so_far, new_cur_min)
  end
end
