# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
# #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Big_O_Time_O(n)_Space_O(n)
# #2024_07_06_Time_261_ms_(94.89%)_Space_77.3_MB_(46.59%)

defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    nums
        |> Enum.with_index()
        |> Enum.reduce_while(%{}, fn {num, index}, map ->
            case map[target - num] do
                nil -> {:cont, Map.put(map, num, index)}
                found -> {:halt, [index, found]}
            end
        end)
  end
end
