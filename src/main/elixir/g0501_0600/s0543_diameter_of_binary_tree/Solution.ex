# #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
# #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
# #2024_08_04_Time_264_ms_(100.00%)_Space_84.2_MB_(50.00%)

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
  @spec diameter_of_binary_tree(root :: TreeNode.t | nil) :: integer
  def diameter_of_binary_tree(root),
    do: rec_diameter(root)
        |> then(fn {max, _} -> max end)

  @spec rec_diameter(root :: TreeNode.t | nil) :: {integer, integer}
  defp rec_diameter(nil), do: {0, 0}
  defp rec_diameter(%TreeNode{left: l, right: r}) do
    {l_max, l_longest} = rec_diameter(l)
    {r_max, r_longest} = rec_diameter(r)
    {max(max(l_max, r_max), l_longest + r_longest), max(l_longest, r_longest) + 1}
  end
end
