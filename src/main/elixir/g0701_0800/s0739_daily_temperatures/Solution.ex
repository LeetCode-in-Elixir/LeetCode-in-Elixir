# #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #LeetCode_75_Monotonic_Stack
# #Programming_Skills_II_Day_6 #Big_O_Time_O(n)_Space_O(n)
# #2024_08_04_Time_955_ms_(100.00%)_Space_143.4_MB_(100.00%)

defmodule Solution do
  @spec daily_temperatures(temp :: [integer]) :: [integer]
  def daily_temperatures(temp) do
    Enum.reverse(temp)
    |> Enum.with_index()
    |> Enum.map_reduce([], &do_map_reduce/2)
    |> elem(0)
    |> Enum.reverse()
  end

  defp do_map_reduce({x, i}, [{y, j} | tail]) when x >= y do
    do_map_reduce({x, i}, tail)
  end
  defp do_map_reduce({x, i}, [{y, j} | tail]) do
    {i - j, [{x, i}, {y, j} | tail]}
  end
  defp do_map_reduce({x, i}, []) do
    {0, [{x, i}]}
  end
end
