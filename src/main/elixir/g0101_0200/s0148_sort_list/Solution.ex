# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
# #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Top_Interview_150_Divide_and_Conquer
# #Big_O_Time_O(log(N))_Space_O(log(N)) #2024_08_03_Time_489_ms_(100.00%)_Space_113.6_MB_(100.00%)

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
  @spec sort_list(head :: ListNode.t | nil) :: ListNode.t | nil
  def sort_list(head) do
    node_to_list(head, [])
    |> Enum.sort(:desc)
    |> list_to_node(nil)
  end

  defp node_to_list(nil, list), do: list
  defp node_to_list(node, list) do
    node_to_list(node.next, [node.val | list])
  end

  defp list_to_node([], node), do: node
  defp list_to_node([x | tail], node) do
    list_to_node(tail, %ListNode{val: x, next: node})
  end
end
