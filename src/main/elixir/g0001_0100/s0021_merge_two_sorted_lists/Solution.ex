# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
# #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
# #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(m+n)_Space_O(m+n)
# #2024_07_31_Time_261_ms_(85.00%)_Space_71.9_MB_(40.00%)

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
  @spec merge_two_lists(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def merge_two_lists(nil, nil), do: nil
  def merge_two_lists(list1, nil), do: list1
  def merge_two_lists(nil, list2), do: list2

  def merge_two_lists(%ListNode{val: val1, next: next1} = list1, %ListNode{val: val2, next: next2} = list2) do
    if val1 <= val2 do
      %ListNode{val: val1, next: merge_two_lists(next1, list2)}
    else
      %ListNode{val: val2, next: merge_two_lists(list1, next2)}
    end
  end
end
