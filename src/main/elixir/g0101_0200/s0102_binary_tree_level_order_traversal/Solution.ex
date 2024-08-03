# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
# #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
# #Big_O_Time_O(N)_Space_O(N) #2024_08_03_Time_252_ms_(100.00%)_Space_74.9_MB_(33.33%)

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
  @spec level_order(root :: TreeNode.t | nil) :: [[integer]]
  def level_order(root) do
    solve(compact([root]), [])
  end
    
  defp solve([], acc), do: Enum.reverse(acc)

  defp solve(layer, acc) do
    values = Enum.map(layer, & &1.val)
    next_layer = layer |> Enum.flat_map(&[&1.left, &1.right]) |> compact()
    solve(next_layer, [values | acc])
  end
    
  defp compact(list) do
    Enum.reject(list, &is_nil/1)  
  end
end
