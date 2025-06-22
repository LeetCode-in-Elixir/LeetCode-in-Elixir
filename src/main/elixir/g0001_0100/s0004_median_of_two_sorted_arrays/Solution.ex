# #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
# #Top_Interview_150_Binary_Search #Big_O_Time_O(log(min(N,M)))_Space_O(1)
# #AI_can_be_used_to_solve_the_task #2024_07_06_Time_474_ms_(86.21%)_Space_75.1_MB_(55.17%)

defmodule Solution do
  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  def find_median_sorted_arrays(nums1, nums2) do
    list = Enum.sort(nums1 ++ nums2)

    cond do
        length(list) === 1 -> 
            Enum.at(list, 0)

        rem(length(list), 2) === 0 -> 
            start_index = trunc(length(list) / 2 - 1)
            (Enum.at(list, start_index) + Enum.at(list, start_index + 1)) / 2

        true -> 
            start_index = div(length(list), 2)
            Enum.at(list, start_index)
    end
  end
end
