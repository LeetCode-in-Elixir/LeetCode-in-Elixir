# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
# #LeetCode_75_Two_Pointers #Algorithm_II_Day_4_Two_Pointers #Top_Interview_150_Two_Pointers
# #Big_O_Time_O(n)_Space_O(1) #2024_07_31_Time_620_ms_(93.33%)_Space_137.1_MB_(6.67%)

defmodule Solution do
  @spec max_area(height :: [integer]) :: integer
  def max_area(height) do
    left = 0
    right = length(height) - 1

    height
    |> List.to_tuple()
    |> solve(left, right, 0)
  end

  def solve(_, l, r, ans) when l == r, do: ans
  def solve(height, l, r, ans) do
    lh = elem(height, l)
    rh = elem(height, r)

    ans = max(min(lh, rh) * (r - l), ans)
    cond do
      lh >= rh -> solve(height, l, r - 1, ans)
      lh < rh -> solve(height, l + 1, r, ans)
    end
  end
end
