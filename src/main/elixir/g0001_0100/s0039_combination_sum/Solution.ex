# #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
# #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
# #Big_O_Time_O(2^n)_Space_O(n+2^n) #2024_08_02_Time_264_ms_(100.00%)_Space_71.9_MB_(66.67%)

defmodule Solution do
  @spec combination_sum(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum(candidates, target) do
    combination_sum_rec(candidates, target, [], [])
  end

  defp combination_sum_rec(_, 0, sublist, ans) do
    [Enum.reverse(sublist) | ans]
  end

  defp combination_sum_rec([], _, _, ans) do
    ans
  end

  defp combination_sum_rec([h | t], target, sublist, ans) when target >= h do
    ans_with_h = combination_sum_rec([h | t], target - h, [h | sublist], ans)
    combination_sum_rec(t, target, sublist, ans_with_h)
  end

  defp combination_sum_rec([_ | t], target, sublist, ans) do
    combination_sum_rec(t, target, sublist, ans)
  end
end