# #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
# #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
# #Big_O_Time_O(n*log(n))_Space_O(k) #2024_08_04_Time_288_ms_(100.00%)_Space_93.7_MB_(100.00%)

defmodule Solution do
  @spec top_k_frequent(nums :: [integer], k :: integer) :: [integer]
  def top_k_frequent(nums, k) do
    nums 
    |> Enum.frequencies() 
    |> Enum.sort(fn {_, x}, {_, y} -> x > y end) 
    |> Enum.take(k)
    |> Enum.map(fn {n, _} -> n end)
  end
end
