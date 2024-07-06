# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
# #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
# #Big_O_Time_O(n)_Space_O(1) #2024_07_06_Time_356_ms_(93.33%)_Space_84.7_MB_(8.89%)

defmodule Solution do
  @spec length_of_longest_substring(s :: String.t()) :: integer
  def length_of_longest_substring(s) do
    sublen([], String.codepoints(s), 0, 0, 0)
  end

  defp sublen(_, [], _, _, m), do: m
  
  defp sublen(left, [next | rest] = right, start, stop, m) do
    if Enum.member?(left, next) do
      [_ | mid] = left
      sublen(mid, right, start + 1, stop, m)
    else
      stop = stop + 1
      sublen(left ++ [next], rest, start, stop, max(m, stop - start))
    end
  end
end
