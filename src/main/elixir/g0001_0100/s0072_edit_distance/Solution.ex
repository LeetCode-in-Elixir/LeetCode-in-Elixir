# #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
# #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
# #Udemy_Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n2)
# #2024_08_02_Time_675_ms_(100.00%)_Space_164.7_MB_(100.00%)

defmodule Solution do
  @spec min_distance(word1 :: String.t, word2 :: String.t) :: integer
  def min_distance(word1, word2) do
    for {ch1, i} <- [" " | String.codepoints(word1)] |> Enum.with_index(),
    {ch2, j} <- [" " | String.codepoints(word2)] |> Enum.with_index(),
    reduce: %{} do map ->
      cond do
        i == 0 -> j
        j == 0 -> i
        ch1 == ch2 -> Map.get(map, {i - 1, j - 1})
        true ->
          Map.get(map, {i - 1, j})
          |> min(Map.get(map, {i - 1, j - 1}))
          |> min(Map.get(map, {i, j - 1}))
          |> Kernel.+(1)
      end
      |> then(&(Map.put(map, {i, j}, &1)))
    end
    |> Map.get({String.length(word1), String.length(word2)})
  end
end