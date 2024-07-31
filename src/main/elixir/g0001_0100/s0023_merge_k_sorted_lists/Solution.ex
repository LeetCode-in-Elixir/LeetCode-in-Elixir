# #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
# #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
# #2024_07_31_Time_215_ms_(100.00%)_Space_72.1_MB_(33.33%)

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
  @spec swap_pairs(head :: ListNode.t | nil) :: ListNode.t | nil
  def swap_pairs(head) when is_nil(head.val) do
    %ListNode{}
  end
    
  def swap_pairs(head) do
    swap(head, nil)
  end
    
  def swap(current_node, last_node) when is_nil(current_node) and not is_nil(last_node) do
    last_node
  end
    
  def swap(current_node, last_node) when is_nil(current_node) do
    nil
  end
    
  def swap(current_node, last_node) when is_nil(last_node) do
    swap(current_node.next, current_node)
  end
    
  def swap(current_node, last_node) do
    current_node
    |> Map.put(:next, last_node |> Map.put(:next, swap(current_node.next, nil)))
  end
end