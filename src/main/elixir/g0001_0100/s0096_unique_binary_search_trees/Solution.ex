# #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
# #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
# #2024_08_03_Time_285_ms_(100.00%)_Space_72_MB_(100.00%)

defmodule Solution do
  @spec num_trees(n :: integer) :: integer
   def num_trees(n) do
    cache = %{0 => 1}
    Enum.reduce(1..n, cache, &unique_trees/2)
    |> Map.get(n)
  end
   def unique_trees(n, cache) do
    count = Enum.map(1..n, fn r ->
      Map.get(cache, r - 1) * Map.get(cache, n - r)
    end)
    |> Enum.sum()
    Map.put(cache, n, count)
  end
end
