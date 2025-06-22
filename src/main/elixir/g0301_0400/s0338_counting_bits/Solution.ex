# #Easy #Dynamic_Programming #Bit_Manipulation #LeetCode_75_Bit_Manipulation
# #Udemy_Bit_Manipulation #Big_O_Time_O(num)_Space_O(num)
# #2024_08_04_Time_330_ms_(100.00%)_Space_93.2_MB_(100.00%)

defmodule Solution do
  @spec count_bits(n :: integer) :: [integer]
  def count_bits(n), do: do_count_bits(1, n, Map.new(0..div(n,2), &({&1,0})), [0])

  defp do_count_bits(i, n, map, acc) when i > n, do: Enum.reverse(acc)
  defp do_count_bits(i, n, map, acc) do
    i_bits = map[div(i,2)] + rem(i,2)
    new_map = if i > div(n,2), do: map, else: Map.put(map, i, i_bits)
    do_count_bits(i + 1, n, new_map, [i_bits | acc])
  end
end
