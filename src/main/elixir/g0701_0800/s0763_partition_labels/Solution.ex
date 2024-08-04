# #Medium #String #Hash_Table #Greedy #Two_Pointers #Data_Structure_II_Day_7_String
# #Big_O_Time_O(n)_Space_O(1) #2024_08_04_Time_286_ms_(100.00%)_Space_72.4_MB_(100.00%)

defmodule Solution do
  @spec partition_labels(s :: String.t()) :: [integer]
  def partition_labels(s) do
    letters = String.graphemes(s)
    position = Enum.reduce(0..(length(letters) - 1), %{}, fn i, acc ->
      Map.put(acc, Enum.at(letters, i), i)
    end)

    partition_labels(letters, position, 0, -1, 0, [])
  end

  defp partition_labels([], _position, _i, prev, _max, result) do
    Enum.reverse(result)
  end

  defp partition_labels([letter | rest], position, i, prev, max, result) do
    current_max = Map.get(position, letter)

    # Update the maximum index to which the current partition must extend
    new_max = max(current_max, max)

    # If we have reached the end of the current partition
    if i == new_max do
      # Add the size of the partition to the result list
      new_result = [i - prev | result]
      partition_labels(rest, position, i + 1, i, 0, new_result)
    else
      partition_labels(rest, position, i + 1, prev, new_max, result)
    end
  end
end
