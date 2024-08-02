# #Hard #Top_100_Liked_Questions #String #Dynamic_Programming #Stack #Big_O_Time_O(n)_Space_O(1)
# #2024_08_02_Time_277_ms_(100.00%)_Space_76.6_MB_(100.00%)

defmodule Solution do
  @spec longest_valid_parentheses(s :: String.t()) :: integer
  def longest_valid_parentheses(s) do
    s
    |> String.graphemes()
    |> dp([], 0)
  end

  def dp([], _, result), do: result

  def dp(["(" | tail], queue, result) do
    dp(tail, [0 | queue], result)
  end

  def dp([")" | tail], queue, result) do
    {new_queue, new_result} = pop_until(queue, [])

    dp(tail, new_queue, max(result, new_result))
  end

  def pop_until([], _), do: {[], 0}

  def pop_until([0 | tail], rest) do
    n = List.first(tail)
    n = if n, do: n, else: 0
    tail = if n > 0, do: tl(tail), else: tail
    result = Enum.sum(rest) + n + 2
    
    {[result | tail], result}
  end

  def pop_until([h | tail], rest) do
    pop_until(tail, [h | rest])
  end
end