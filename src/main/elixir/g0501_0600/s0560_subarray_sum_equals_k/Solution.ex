# #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
# #Big_O_Time_O(n)_Space_O(n) #2024_08_04_Time_381_ms_(100.00%)_Space_87.5_MB_(100.00%)

defmodule Solution do
  @spec subarray_sum(nums :: [integer], k :: integer) :: integer
  def subarray_sum(nums, k) do
    nums |> Enum.reduce({0, 0, %{0 => 1}}, fn n, {ans, pre_sum, map} ->
      pre_sum = pre_sum + n
      ans = ans + Map.get(map, pre_sum - k, 0)
      {ans, pre_sum, Map.update(map, pre_sum, 1, &(&1 + 1))}
    end)
    |> elem(0)
  end
end
