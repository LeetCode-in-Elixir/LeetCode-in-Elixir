# #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
# #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
# #2024_07_31_Time_244_ms_(66.67%)_Space_72.2_MB_(33.33%)

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
  @spec swap_pairs(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def swap_pairs(nil), do: nil
  def swap_pairs(head), do: swap_pairs(head, head.next)

  def swap_pairs(head, nil), do: head

  def swap_pairs(first, second) do
    %ListNode{
      second
      | next: %ListNode{
          first
          | next:
              unless second.next == nil do
                swap_pairs(second.next, second.next.next)
              else
                nil
              end
        }
    }
  end
end
