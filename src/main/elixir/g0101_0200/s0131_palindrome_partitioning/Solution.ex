# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
# #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
# #2024_08_03_Time_398_ms_(100.00%)_Space_98.7_MB_(100.00%)

defmodule Solution do
  use Agent

  @spec partition(s :: String.t()) :: [[String.t()]]
  def partition(s) do
    dfs(s, String.length(s), 0, [], [])
  end

  def dfs(_s, len, l, subs, ans) when l == len do
    [Enum.reverse(subs) | ans]
  end

  def dfs(s, len, l, subs, ans) do
    l..(len - 1)
    |> Enum.reduce(ans, fn r, ans ->
      ss = String.slice(s, l..r)

      if ss == String.reverse(ss) do
        dfs(s, len, r + 1, [ss | subs], ans)
      else
        ans
      end
    end)
  end
end
