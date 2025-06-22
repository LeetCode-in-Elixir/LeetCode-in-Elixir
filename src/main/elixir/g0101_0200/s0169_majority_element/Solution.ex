# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
# #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
# #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
# #2024_08_03_Time_278_ms_(100.00%)_Space_89.8_MB_(61.54%)

defmodule Solution do
  @spec majority_element(nums :: [integer]) :: integer
  def majority_element([head | tail]), do: recur(tail, 1, head)

  defp recur([head | tail], 0, _candidate), do: recur(tail, 1, head)

  defp recur([last], _count, candidate) when last === candidate, do: candidate

  defp recur([last, last], _count, candidate) when last === candidate, do: candidate

  defp recur([head | tail], count, candidate) when head === candidate,
    do: recur(tail, count + 1, candidate)

  defp recur([_head | tail], count, candidate), do: recur(tail, count - 1, candidate)

  defp recur([], _count, candidate), do: candidate
end
