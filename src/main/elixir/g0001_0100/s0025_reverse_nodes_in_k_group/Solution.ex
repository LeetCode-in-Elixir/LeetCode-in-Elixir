# #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
# #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(k)
# #2024_07_31_Time_237_ms_(100.00%)_Space_74.4_MB_(50.00%)

# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec reverse_k_group(head :: ListNode.t() | nil, k :: integer) :: ListNode.t() | nil
  def reverse_k_group(head, k) do
    cond do
      # if length is less then k then do not change it
      length(0, head) < k -> head
      true -> head |> drop(k) |> reverse_k_group(k) |> reverse_list(head, k)
    end
  end

  def reverse_list(acc, _, 0), do: acc

  def reverse_list(acc, list, k) do
    reverse_list(%ListNode{list | next: acc}, list.next, k - 1)
  end

  def drop(nil, _), do: nil
  def drop(head, 0), do: head
  def drop(head, n), do: drop(head.next, n - 1)

  def length(acc, nil), do: acc
  def length(acc, head), do: length(acc + 1, head.next)

end
