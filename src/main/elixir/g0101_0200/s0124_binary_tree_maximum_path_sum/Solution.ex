# #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
# #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Top_Interview_150_Binary_Tree_General
# #Big_O_Time_O(N)_Space_O(N) #2024_08_03_Time_291_ms_(100.00%)_Space_97.2_MB_(100.00%)

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
  @spec max_path_sum(root :: TreeNode.t | nil) :: integer
  def max_path_sum(%TreeNode{val: val, left: nil, right: nil}), do: val
  def max_path_sum(root) do
    max_path(root, -1001) |> elem(1)
  end

  def max_path(%TreeNode{val: val, left: left, right: right}, max) do
    {lval, lmax} = max_path(left, max)
    {rval, rmax} = max_path(right, max)

    {
      [(lval + val), (rval + val), val] |> Enum.max(), 
      [max, val, val + lval, val + rval, val + lval + rval, lmax, rmax] |> Enum.max()
    }
  end
  def max_path(nil, max), do: {0, max}
end
