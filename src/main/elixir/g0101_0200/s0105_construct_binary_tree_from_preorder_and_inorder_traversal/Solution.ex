# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
# #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Top_Interview_150_Binary_Tree_General
# #Big_O_Time_O(N)_Space_O(N) #2024_08_03_Time_385_ms_(100.00%)_Space_75.6_MB_(50.00%)

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
  @spec build_tree(preorder :: [integer], inorder :: [integer]) :: TreeNode.t() | nil
  def build_tree([], []), do: nil
  def build_tree(preorder, inorder) do
    [head | preorder] = preorder

    {left_inorder, [_ | right_inorder]} =
      inorder
      |> Enum.split_while(&(&1 != head))

    {left_preorder, right_preorder} = take_n_drop(preorder, length(left_inorder))

    %TreeNode{
      val: head,
      left: build_tree(left_preorder, left_inorder),
      right: build_tree(right_preorder, right_inorder)
    }
  end

  def take_n_drop(list, n, acc \\ [])

  def take_n_drop(list, 0, acc) do
    {acc |> Enum.reverse(), list}
  end

  def take_n_drop([head | tail], n, acc) do
    take_n_drop(tail, n - 1, [head | acc])
  end
end
