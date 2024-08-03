# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
# #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
# #Big_O_Time_O(2^n)_Space_O(n*2^n) #2024_08_03_Time_229_ms_(100.00%)_Space_72.4_MB_(100.00%)

defmodule Solution do
   @spec subsets(nums :: [integer]) :: [[integer]]
  def subsets(nums) do
    arr_lenth = length(nums)

    0..arr_lenth
    |> Enum.reduce([], fn x, acc ->
      Enum.concat(combinations(x, nums), acc)
    end)
    |> Enum.sort_by(&length/1)
  end

  def combinations(0, _), do: [[]]
  def combinations(_, []), do: []

  def combinations(size, [head | tail]) do
    for elem <- combinations(size - 1, tail) do
      [head | elem]
    end ++ combinations(size, tail)
  end
end
