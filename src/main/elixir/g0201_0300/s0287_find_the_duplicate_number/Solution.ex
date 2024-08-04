# #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
# #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
# #2024_08_04_Time_1322_ms_(100.00%)_Space_165_MB_(100.00%)

defmodule Solution do
  @spec find_duplicate(nums :: [integer]) :: integer
  def find_duplicate(nums) do
    (nums -- Enum.uniq(nums)) |> hd
  end
end
