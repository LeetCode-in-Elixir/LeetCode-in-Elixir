# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
# #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
# #Udemy_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
# #2024_08_02_Time_292_ms_(100.00%)_Space_73.4_MB_(100.00%)

defmodule Solution do
  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target) do
    Enum.find_index(nums,&(&1 == target)) || -1
  end
end
