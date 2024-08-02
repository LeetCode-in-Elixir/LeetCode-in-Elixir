# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
# #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
# #Big_O_Time_O(n*k_log_k)_Space_O(n) #2024_08_02_Time_339_ms_(66.67%)_Space_88_MB_(66.67%)

defmodule Solution do
  @spec group_anagrams(strs :: [String.t]) :: [[String.t]]
  def group_anagrams(strs) do
    strs
    |> Enum.group_by(&sorted_chars/1)
    |> Map.values()
  end

  defp sorted_chars(str) do
    str
    |> String.graphemes()
    |> Enum.sort()
    |> Enum.join()
  end
end
