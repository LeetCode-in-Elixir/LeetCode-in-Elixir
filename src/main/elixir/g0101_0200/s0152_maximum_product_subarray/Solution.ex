# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
# #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
# #Big_O_Time_O(N)_Space_O(1) #2024_08_03_Time_322_ms_(100.00%)_Space_80.7_MB_(100.00%)

defmodule Solution do
  @spec max_product(nums :: [integer]) :: integer
  def max_product(nums) do
    nums
    |> Stream.chunk_by(& &1 == 0)
    |> Stream.map(&max_prod/1)
    |> Enum.max()
  end
      
  defp max_prod([0 | _]), do: 0
                            
  defp max_prod([n]), do: n
                            
  defp max_prod(chunk) do
    prod = Enum.product(chunk)
    max(
      div_till_pos(prod, chunk),
      div_till_pos(prod, Enum.reverse(chunk))
    )
  end
      
  defp div_till_pos(prod, _) when prod > 0, do: prod
  defp div_till_pos(prod, [n | t]), do: prod |> div(n) |> div_till_pos(t)
end
