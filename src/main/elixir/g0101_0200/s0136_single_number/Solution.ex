# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation
# #Data_Structure_II_Day_1_Array #Algorithm_I_Day_14_Bit_Manipulation #Udemy_Integers
# #Big_O_Time_O(N)_Space_O(1) #2024_08_03_Time_295_ms_(100.00%)_Space_84.9_MB_(85.71%)

defmodule Solution do
  @spec single_number(nums :: [integer]) :: integer
  def single_number(nums) do
    nums
    |> Enum.frequencies()
    |> Enum.find(fn {k, v} -> v == 1 end)
    |> elem(0)
  end
end
