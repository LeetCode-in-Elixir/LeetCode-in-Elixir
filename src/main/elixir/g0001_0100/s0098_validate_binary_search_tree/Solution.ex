# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
# #Binary_Search_Tree #Data_Structure_I_Day_14_Tree #Level_1_Day_8_Binary_Search_Tree
# #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(log(N))
# #2024_08_03_Time_239_ms_(100.00%)_Space_82.9_MB_(33.33%)

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
  @spec is_valid_bst(root :: TreeNode.t() | nil) :: boolean
  def is_valid_bst(root) do
    root |> inorder_check() |> is_list()
  end

  @spec inorder_check(root :: TreeNode.t() | nil) :: [integer] | :invalid
  def inorder_check(root) do
    inorder_check(root, [])
  end

  def inorder_check(nil, acc), do: acc

  def inorder_check(root, acc) do
    # root comes in between in inorder traversal
    case inorder_check(root.left, acc) do
      [x | _] = acc ->
        if x >= root.val do
          :invalid
        else
          acc = [root.val | acc]
          inorder_check(root.right, acc)
        end

      [] ->
        acc = [root.val | acc]
        inorder_check(root.right, acc)

      _ ->
        :invalid
    end
  end
end
