# #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
# #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
# #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
# #2024_08_04_Time_722_ms_(100.00%)_Space_326.9_MB_(100.00%)

defmodule Solution do
  @spec longest_common_subsequence(text1 :: String.t, text2 :: String.t) :: integer
  def longest_common_subsequence(text1, text2) do
    text1
    |> String.myers_difference(text2)
    |> Enum.reduce(0, fn
      {:eq, chars}, acc -> acc + String.length(chars)
      _, acc -> acc
    end)
  end
end
