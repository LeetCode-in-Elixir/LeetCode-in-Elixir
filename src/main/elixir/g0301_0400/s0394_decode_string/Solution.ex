# #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
# #Big_O_Time_O(n)_Space_O(n) #2024_08_04_Time_268_ms_(100.00%)_Space_71.4_MB_(100.00%)

defmodule Solution do
  @spec decode_string(s :: String.t()) :: String.t()
  def decode_string(s) do
    decode_string_helper(s, 0, [])
    |> elem(0)
    |> Enum.reverse()
    |> List.to_string()
  end

  defp decode_string_helper(s, i, acc) do
    if i >= String.length(s) do
      {acc, i}
    else
      case String.at(s, i) do
        <<c>> when c in ?a..?z or c in ?A..?Z ->
          decode_string_helper(s, i + 1, [c | acc])

        <<c>> when c in ?0..?9 ->
          {count, i} = parse_number(s, i)
          {repeat, i} = decode_string_helper(s, i + 1, [])
          repeated = Enum.flat_map(1..count, fn _ -> repeat end)
          decode_string_helper(s, i, repeated ++ acc)

        "]" ->
          {acc, i + 1}

        _ ->
          decode_string_helper(s, i + 1, acc)
      end
    end
  end

  defp parse_number(s, i) do
    parse_number(s, i, 0)
  end

  defp parse_number(s, i, acc) do
    if i < String.length(s) and String.at(s, i) =~ ~r/\d/ do
      acc = acc * 10 + String.to_integer(String.at(s, i))
      parse_number(s, i + 1, acc)
    else
      {acc, i}
    end
  end
end
