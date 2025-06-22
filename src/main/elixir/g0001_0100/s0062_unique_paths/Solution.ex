# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math
# #Combinatorics #LeetCode_75_DP/Multidimensional #Algorithm_II_Day_13_Dynamic_Programming
# #Dynamic_Programming_I_Day_15 #Level_1_Day_11_Dynamic_Programming
# #Big_O_Time_O(m*n)_Space_O(m*n) #2024_08_02_Time_233_ms_(100.00%)_Space_71.9_MB_(66.67%)

defmodule Solution do
  @spec unique_paths(m :: integer, n :: integer) :: integer
  def unique_paths(m, n) do
    ncr(m + n - 2, min(m, n) - 1)
  end

  defp ncr(n, r) do
    Enum.reduce(1..r#1, 1, fn i, acc ->
      div(acc * (i + n - r), i)
    end)
  end
end
