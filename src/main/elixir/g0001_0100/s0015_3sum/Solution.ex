# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
# #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
# #Big_O_Time_O(n*log(n))_Space_O(n^2) #2024_07_31_Time_717_ms_(100.00%)_Space_78.5_MB_(100.00%)

defmodule Solution do
  @spec three_sum(nums :: [integer]) :: [[integer]]
  def three_sum(nums) do
    Enum.sort(nums)
    |> Enum.with_index()
    |> find([])
  end

  defp drop_all(list, val) do
    Enum.drop_while(list, fn {x, _} -> x == val end)
  end

  defp find([], ans), do: ans
  defp find([{x, _} | nums], ans) do
    ans =
      Enum.reverse(nums)
      |> two_pointers(nums, x, ans)

    drop_all(nums, x)
    |> find(ans)
  end

  defp two_pointers([], _, _, ans), do: ans
  defp two_pointers(_, [], _, ans), do: ans
  defp two_pointers([{_, j} | _], [{_, i} | _], _, ans)
  when i >= j, do: ans
  
  defp two_pointers([{z, j} | nums2], [{y, i} | nums], x, ans) do
    {nums2, nums, ans} = cond do
      x + y + z == 0 ->
        {drop_all(nums2, z), drop_all(nums, y), [[x, y, z] | ans]}
      x + y + z > 0 -> {drop_all(nums2, z), [{y, i} | nums], ans}
      true -> {[{z, j} | nums2], drop_all(nums, y), ans}
    end

    two_pointers(nums2, nums, x, ans)
  end
end