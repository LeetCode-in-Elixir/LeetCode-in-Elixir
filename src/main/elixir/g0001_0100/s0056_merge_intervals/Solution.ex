# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
# #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
# #Top_Interview_150_Intervals #Big_O_Time_O(n_log_n)_Space_O(n)
# #2024_08_02_Time_305_ms_(100.00%)_Space_80.6_MB_(100.00%)

defmodule Solution do
  @spec merge(intervals :: [[integer]]) :: [[integer]]
  def merge(intervals) do
    intervals
    |> Enum.sort_by(&hd(&1))
    |> Enum.reduce([], fn [start, finish], acc ->
      case acc do
        [] -> [[start, finish]]
        [[prev_start, prev_finish] | rest] ->
          if prev_finish >= start do
            # Merge overlapping intervals
            [[prev_start, max(prev_finish, finish)] | rest]
          else
            # No overlap
            [[start, finish] | acc]
          end
      end
    end)
    |> Enum.reverse()
  end
end
