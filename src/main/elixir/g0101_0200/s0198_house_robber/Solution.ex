# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
# #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
# #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
# #2024_08_03_Time_249_ms_(100.00%)_Space_72.1_MB_(100.00%)

defmodule Solution do
  @spec rob(nums :: [integer]) :: integer
  def rob(nums) do
    do_rob([0, 0, 0] ++ nums)
  end

  defp do_rob([a, b, c, d]), do: max(c, max(a,b) + d)
  defp do_rob([a, b, c, d | rest]), do: do_rob([ b, c, max(a, b) + d | rest])
end
