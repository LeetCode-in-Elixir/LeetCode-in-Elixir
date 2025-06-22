# #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
# #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
# #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
# #2024_08_02_Time_299_ms_(100.00%)_Space_79.2_MB_(33.33%)

defmodule Solution do
  @spec jump(nums :: [integer]) :: integer
  def jump(nums) do
    min_jump(nums, 0, 0, length(nums) - 1, 0)
  end
  
  defp min_jump(_, move, _, dest, ans) when move >= dest, do: ans
  defp min_jump(_, _, next_move, dest, ans) when next_move >= dest, do: ans + 1
  defp min_jump([x | nums], 0, next_move, dest, ans) do
    min_jump(nums, max(x, next_move) - 1, 0, dest - 1, ans + 1)
  end
  defp min_jump([x | nums], move, next_move, dest, ans) do
    min_jump(nums, move - 1, max(x, next_move) - 1, dest - 1, ans)
  end
end
