# #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
# #Big_O_Time_O(n)_Space_O(n) #2024_08_02_Time_806_ms_(100.00%)_Space_156.3_MB_(100.00%)

defmodule Solution do
  @spec first_missing_positive(nums :: [integer]) :: integer
  def first_missing_positive(nums) do
    nums
    |> Enum.sort()
    |> find_missing_num()
  end

  defp find_missing_num(nums, acc \\ 1)

  defp find_missing_num([], acc) do
    acc
  end

  defp find_missing_num([h | t], acc) do
    acc = if h == acc, do: acc + 1, else: acc
    find_missing_num(t, acc)
  end
end
