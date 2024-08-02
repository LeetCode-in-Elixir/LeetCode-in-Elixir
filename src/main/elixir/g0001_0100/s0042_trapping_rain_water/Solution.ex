# #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
# #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
# #Big_O_Time_O(n)_Space_O(1) #2024_08_02_Time_280_ms_(100.00%)_Space_84.3_MB_(100.00%)

defmodule Solution do
  @spec trap(h :: [integer]) :: integer
  def trap(h) do
    h = List.to_tuple(h)
    trap(h, 0, 0, 0, tuple_size(h) - 1, 0)
  end

  defp trap(_, _, _, idx_l, idx_r, acc) when idx_l > idx_r, do: acc
  defp trap(h, lmax, rmax, idx_l, idx_r, acc) when lmax <= rmax do
    current = elem(h, idx_l)
    new_lmax = max(lmax, current)
    trap(h, new_lmax, rmax, idx_l + 1, idx_r, acc + new_lmax - current)
  end

  defp trap(h, lmax, rmax, idx_l, idx_r, acc) when lmax > rmax do
    current = elem(h, idx_r)
    new_rmax = max(rmax, current)
    trap(h, lmax, new_rmax, idx_l, idx_r - 1, acc + new_rmax - current)
  end
end