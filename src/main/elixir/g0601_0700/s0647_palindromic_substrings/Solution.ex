# #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
# #2024_08_04_Time_326_ms_(100.00%)_Space_71.3_MB_(100.00%)

defmodule Solution do
  @spec count_substrings(s :: String.t()) :: integer
  def count_substrings(s) do
    tuple_s =
      s
      |> String.graphemes()
      |> List.to_tuple()

    get_count(tuple_s, 0, 0)
  end

  def get_count(tuple_s, count, i) when i >= tuple_size(tuple_s) do
    count
  end

  def get_count(tuple_s, count, i) do
    left = right = i
    count = count + while(tuple_s, 0, left, right)

    left = i
    right = i + 1
    count = count + while(tuple_s, 0, left, right)

    get_count(tuple_s, count, i + 1)
  end

  def while(tuple_s, acc, left, right)
      when left < 0 or
             right >= tuple_size(tuple_s) or
             elem(tuple_s, left) != elem(tuple_s, right) do
    acc
  end

  def while(tuple_s, acc, left, right) do
    while(tuple_s, acc + 1, left - 1, right + 1)
  end
end
