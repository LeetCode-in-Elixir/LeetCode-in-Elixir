# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
# #Data_Structure_II_Day_9_String #Algorithm_II_Day_14_Dynamic_Programming
# #Dynamic_Programming_I_Day_17 #Udemy_Strings #Top_Interview_150_Multidimensional_DP
# #Big_O_Time_O(n)_Space_O(n) #2024_07_06_Time_337_ms_(100.00%)_Space_72.9_MB_(85.71%)

defmodule Solution do
  @spec longest_palindrome(s :: String.t()) :: String.t()
  def longest_palindrome(<<>>), do: ""
  def longest_palindrome(<<f::binary-size(1)>>), do: f
  def longest_palindrome(s) do
    {ri,rj} =String.to_charlist(s) |> List.to_tuple |>  do_longest_palindrome(0, {0,0})
    String.slice(s,ri..rj)
  end

  defp do_longest_palindrome(s_t,i,{ri,rj}) when i == tuple_size(s_t), do: {ri,rj}
  defp do_longest_palindrome(s_t,i,{ri,rj}) do
    {ri,rj} = do_longest_palindrome(s_t,i,i,{ri,rj})
    {ri,rj} = do_longest_palindrome(s_t,i,i+1,{ri,rj})
    do_longest_palindrome(s_t, i+1, {ri, rj})
  end

  defp do_longest_palindrome(s_t,i,j,{ri,rj}) when (i<0 or j==tuple_size(s_t)) or (elem(s_t,i) != elem(s_t,j)) do
    if ((j-1)-(i+1)) > rj-ri, do: {i+1,j-1}, else: {ri,rj}
  end
  defp do_longest_palindrome(s_t,i,j,{ri,rj}), do: do_longest_palindrome(s_t, i-1, j+1, {ri,rj})
end
