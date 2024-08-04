# #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
# #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
# #Udemy_Dynamic_Programming #Big_O_Time_O(n*log_n)_Space_O(n)
# #2024_08_04_Time_259_ms_(100.00%)_Space_75.5_MB_(66.67%)

defmodule Solution do
  @spec length_of_lis(nums :: [integer]) :: integer
  def length_of_lis(nums) do
    Enum.reduce(nums, :gb_sets.new(), fn x, gb ->
      :gb_sets.iterator_from(x, gb)
      |> :gb_sets.next()
      |> then(fn
        :none -> :gb_sets.insert(x, gb)
        {^x, _} -> gb
        {y, _} ->
          :gb_sets.delete(y, gb)
          |> then(&:gb_sets.insert(x, &1))
      end)
    end)
    |> :gb_sets.size()
  end
end
