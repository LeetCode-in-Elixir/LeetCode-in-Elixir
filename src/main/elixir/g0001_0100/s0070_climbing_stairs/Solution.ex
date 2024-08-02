# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
# #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
# #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
# #2024_08_02_Time_255_ms_(100.00%)_Space_71.6_MB_(100.00%)

defmodule Solution do
  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(1), do: 1
  def climb_stairs(2), do: 2
  def climb_stairs(n), do: do_climb_stairs(1, 2, n - 2)
  
  defp do_climb_stairs(a, b, n) when n > 0, do: do_climb_stairs(b, a + b, n - 1)
  defp do_climb_stairs(_, b, _), do: b
end