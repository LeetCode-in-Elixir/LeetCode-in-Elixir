# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
# #Top_Interview_150_Hashmap #Big_O_Time_O(N_log_N)_Space_O(1)
# #2024_08_03_Time_669_ms_(100.00%)_Space_208.6_MB_(85.71%)

defmodule Solution do
  @spec longest_consecutive(nums :: [integer]) :: integer
  def longest_consecutive(nums) do
    nums 
      |> Enum.sort()
      |> count_consecutive([1])
      |> Enum.max() # find max 
  end

  defp count_consecutive(nums = [head_1, head_2 | tail], 
                         seq_lens = [seq_head | _seq_tail]) do
    new_len = 
      case (head_1 - head_2) do
        -1 -> seq_head + 1 # element is consecutive, increment
        0  -> seq_head     # element is same, do nothing
        _  -> 1            # element not consecutive, reset count
      end

    # Prepend count of consecutive elements
    count_consecutive([head_2 | tail], [new_len | seq_lens]) 
  end

  defp count_consecutive([_h | []], seq_lens), do: seq_lens # terminates when list is empty

  defp count_consecutive([], [_h | []]), do: [0] # runs if list has single number
end
