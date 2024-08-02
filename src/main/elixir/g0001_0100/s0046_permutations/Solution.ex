# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
# #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
# #Udemy_Backtracking/Recursion #Big_O_Time_O(n*n!)_Space_O(n+n!)
# #2024_08_02_Time_225_ms_(100.00%)_Space_71.8_MB_(100.00%)

defmodule Solution do
  @spec permute(nums :: [integer]) :: [[integer]]
  def permute([]),   do: [[]] 
  def permute(nums), do: for h <- nums, t <- permute(nums -- [h]), do: [h | t]
end
