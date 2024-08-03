# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
# #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
# #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Big_O_Time_O(M+max*N)_Space_O(M+N+max)
# #2024_08_03_Time_263_ms_(100.00%)_Space_72.1_MB_(100.00%)

defmodule Solution do
  @spec word_break(s :: String.t, word_dict :: [String.t]) :: boolean
  def word_break(s, word_dict) do
    Task.async(fn ->
      breakable?(s, 0, Enum.map(word_dict, &{&1, byte_size(&1)}))
    end)
    |> Task.await()
  end

  defp breakable?("", _idx, _words), do: true

  defp breakable?(s, idx, words) do
    memoized(idx, fn ->
      Enum.any?(words, fn {word, len} ->
        case s do
          <<^word::binary-size(len), rest::binary>> ->
            breakable?(rest, idx + len, words)

          _ ->
            false
        end
      end)
    end)
  end

  defp memoized(key, fun) do
    with nil <- Process.get(key) do
      fun.() |> tap(&Process.put(key, &1))
    end
  end
end
