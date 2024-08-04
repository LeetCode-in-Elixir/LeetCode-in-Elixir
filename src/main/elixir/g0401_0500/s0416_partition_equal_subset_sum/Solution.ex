# #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
# #Big_O_Time_O(n*sums)_Space_O(n*sums) #2024_08_04_Time_1982_ms_(100.00%)_Space_74.9_MB_(100.00%)

defmodule Solution do
  @spec can_partition(nums :: [integer]) :: boolean
  def can_partition(nums) do
    sum = Enum.sum(nums)

    if rem(sum, 2) != 0 do
      false
    else
      target = div(sum, 2)

      for n <- nums, s <- target..n, reduce: %{0 => true} do
        dp -> Map.put(dp, s, Map.get(dp, s, false) || Map.get(dp, s - n, false))
      end
      |> Map.get(target)
    end
  end
end
