# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
# #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
# #Big_O_Time_O(2^n)_Space_O(n) #2024_07_31_Time_229_ms_(100.00%)_Space_71.5_MB_(100.00%)

defmodule Solution do
  @spec generate_parenthesis(n :: integer) :: [String.t()]
  def generate_parenthesis(n) do
    generate("", n, n, [])
  end

  defp generate(current, 0, 0, acc) do
    [current | acc]
  end

  defp generate(current, open, close, acc) when open > 0 do
    acc = generate(current <> "(", open - 1, close, acc)
    if open < close do
      generate(current <> ")", open, close - 1, acc)
    else
      acc
    end
  end

  defp generate(current, _open, close, acc) when close > 0 do
    generate(current <> ")", 0, close - 1, acc)
  end
end
