# #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
# #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
# #2024_08_03_Time_583_ms_(100.00%)_Space_127.4_MB_(50.00%)

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
  @spec is_palindrome(head :: ListNode.t | nil) :: boolean
  def is_palindrome(head) do
    reverse(head, nil) == head
  end

  defp reverse(nil, acc), do: acc

  defp reverse(%ListNode{} = node, acc) do
    reverse(node.next, %{node | next: acc})
  end
end
