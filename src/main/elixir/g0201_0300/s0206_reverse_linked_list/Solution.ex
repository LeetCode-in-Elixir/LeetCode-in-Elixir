# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
# #LeetCode_75_LinkedList #Data_Structure_I_Day_8_Linked_List
# #Algorithm_I_Day_10_Recursion_Backtracking #Level_1_Day_3_Linked_List #Udemy_Linked_List
# #Big_O_Time_O(N)_Space_O(1) #2024_08_03_Time_278_ms_(100.00%)_Space_73.4_MB_(100.00%)

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
  @spec reverse_list(head :: ListNode.t | nil) :: ListNode.t | nil
  def reverse_list(nil),                              do: nil
  def reverse_list(%ListNode{val: v, next: n}),       do: reverse_list(n, %ListNode{val: v, next: nil})
  def reverse_list(%ListNode{val: v, next: n}, acc),  do: reverse_list(n, %ListNode{val: v, next: acc})
  def reverse_list(nil, acc),                         do: acc
end
