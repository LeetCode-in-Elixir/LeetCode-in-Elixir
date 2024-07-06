# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
# #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
# #Big_O_Time_O(max(N,M))_Space_O(max(N,M)) #2024_07_06_Time_353_ms_(88.68%)_Space_72.6_MB_(9.43%)

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
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    add(l1, l2, 0)
  end

  defp add(nil, nil, 0), do: nil
  defp add(l1, l2, carry) do
    {val1, next1} = content(l1)
    {val2, next2} = content(l2)
    sum = val1 + val2 + carry
    %ListNode{val: rem(sum, 10), next: add(next1, next2, div(sum, 10))}
  end

  defp content(nil), do: {0, nil}
  defp content(node), do: {node.val, node.next}
end
