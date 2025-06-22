# #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
# #Binary_Search_I_Day_12 #Udemy_Binary_Search #Top_Interview_150_Binary_Search
# #Big_O_Time_O(log_N)_Space_O(log_N) #2024_08_03_Time_991_ms_(100.00%)_Space_76.1_MB_(100.00%)

defmodule Solution do
  @spec find_min(nums :: [integer]) :: integer
  def find_min([n]), do: n

  def find_min(nums) do
    count = length(nums)
    mid = div(count, 2)
    left = Enum.slice(nums, 0, mid)
    remainder = count - mid
    right = Enum.slice(nums, mid, remainder)
    dbg(binding())
    min(find_min(left), find_min(right))
  end
end
