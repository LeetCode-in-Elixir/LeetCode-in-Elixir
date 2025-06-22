# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
# #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Top_Interview_150_Stack
# #Big_O_Time_O(n)_Space_O(n) #2024_07_31_Time_252_ms_(81.48%)_Space_71.9_MB_(77.78%)

defmodule Solution do

  @compliments %{
      ")" => "(",
      "]" => "[",
      "}" => "{"
  }

  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do
    s
    # charlists are easy
    |> String.graphemes()
    # rly gross reduce, but it is a functional way to carry our stack along.
    |> List.foldl([], fn item, acc -> 
         case Map.get(@compliments, item) do
            # Not a closer, just add it to the stack
            nil -> [item | acc]
            # Closer of some kind - check if the top of the stack is 
            # the compliment - if not, add it to the stack.
            # If it is, we can drop one from the stack to clear that set.
            c -> if c == List.first(acc) do
                Enum.drop(acc, 1)
            else 
                [item | acc]
            end
         end
       end)
    # If the stack is empty, then it's valid. Else, we'll
    # have some junk left over from the mismatched pairs.
    |> Enum.empty?()
  end
end
