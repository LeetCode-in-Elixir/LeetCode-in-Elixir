# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
# #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Big_O_Time_O(L)_Space_O(L)
# #2024_07_31_Time_275_ms_(100.00%)_Space_72_MB_(33.33%)

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
  @spec remove_nth_from_end(head :: ListNode.t | nil, n :: integer) :: ListNode.t | nil
  def remove_nth_from_end(%ListNode{next: nil}, 1), do: nil

  def remove_nth_from_end(list_node, 1) do
    list_node
    |> node_list_to_array()
    |> Enum.slice(1..-1)
    |> array_to_list_node()
  end

  def remove_nth_from_end(%ListNode{} = head, n) do
    n = n - 1
    head = node_list_to_array(head)
    head = Enum.slice(head, 0..(n - 1)) |> Enum.concat(Enum.slice(head, (n + 1)..-1))
    array_to_list_node(head)
  end

  def node_list_to_array(list_node), do: node_list_to_array(list_node, [])
  def node_list_to_array(%ListNode{next: nil, val: elem}, array), do: [elem | array]

  def node_list_to_array(%ListNode{next: some, val: elem}, array) do
    node_list_to_array(some, [elem | array])
  end

  def array_to_list_node([h | t]) do
    array_to_list_node(t, %ListNode{next: nil, val: h})
  end

  def array_to_list_node([], last_node), do: last_node

  def array_to_list_node([h | t], last_node) do
    array_to_list_node(t, %ListNode{next: last_node, val: h})
  end
end