# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
# #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
# #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(N)_Space_O(log(N))
# #2024_08_03_Time_255_ms_(60.00%)_Space_72.3_MB_(100.00%)

# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  @spec is_symmetric(root :: TreeNode.t() | nil) :: boolean
  def is_symmetric(nil), do: true
  def is_symmetric(%TreeNode{left: left, right: right}) do
    helper(left, right)
  end

  defp helper(nil, nil), do: true
  defp helper(nil, _), do: false
  defp helper(_, nil), do: false
  defp helper(%TreeNode{val: val1, left: left1, right: right1}, %TreeNode{val: val2, left: left2, right: right2}) do
    val1 == val2 and helper(left1, right2) and helper(right1, left2)
  end
end
