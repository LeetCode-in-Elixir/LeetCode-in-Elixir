# #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
# #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
# #2024_08_03_Time_225_ms_(100.00%)_Space_71.9_MB_(40.00%)

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
  @spec inorder_traversal(root :: TreeNode.t | nil) :: [integer]
  def inorder_traversal(root) do
    []
    |> in_walk(root, &[&2 | &1])
    |> Enum.reverse()
  end

  @spec in_walk(acc, nil | TreeNode.t, (acc, val -> acc)) :: acc
        when acc: any, val: any
  defp in_walk(acc, nil, _fun), do: acc

  defp in_walk(acc, node, fun) do
    acc
    |> in_walk(node.left, fun)
    |> fun.(node.val)
    |> in_walk(node.right, fun)
  end
end
