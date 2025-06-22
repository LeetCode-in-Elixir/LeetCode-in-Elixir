# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
# #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
# #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
# #2024_08_02_Time_437_ms_(100.00%)_Space_89.3_MB_(69.23%)

defmodule Solution do
  @spec can_jump(nums :: [integer]) :: boolean
  def can_jump(nums) do
    can?(0, length(nums) - 1, nums)
  end

  defp can?(reach, dist, _) when reach >= dist, do: true
  defp can?(reach, _, _) when reach < 0, do: false
  defp can?(reach, dist, [head | tail]) do
    can?(max(reach, head) - 1, dist - 1, tail)
  end
end
