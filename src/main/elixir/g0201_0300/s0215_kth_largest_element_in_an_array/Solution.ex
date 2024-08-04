# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
# #Divide_and_Conquer #Quickselect #Data_Structure_II_Day_20_Heap_Priority_Queue
# #Big_O_Time_O(n*log(n))_Space_O(log(n))
# #2024_08_03_Time_1341_ms_(100.00%)_Space_152.4_MB_(100.00%)

defmodule Solution do
  @spec find_kth_largest(nums :: [integer], k :: integer) :: integer
  def find_kth_largest(nums, k) do
  nums
    |> Enum.with_index()
    |> Enum.reduce(:gb_sets.new(), fn {n, i}, q ->
          cond do
            :gb_sets.is_member({n,i}, q) ->
              q
            :gb_sets.size(q) < k ->
              :gb_sets.insert({n,i}, q)
            true ->
              {smol, qq} = :gb_sets.take_smallest(q)
              :gb_sets.insert(max(smol, {n,i}), qq)
          end
        end)
    |> :gb_sets.smallest()
    |> elem(0)
  end
end
