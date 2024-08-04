# #Medium #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree #Big_O_Time_O(n)_Space_O(n)
# #2024_08_04_Time_336_ms_(100.00%)_Space_110.5_MB_(100.00%)

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
  def path_sum(nil, _, _), do: 0
  @spec path_sum(root :: TreeNode.t | nil, target_sum :: integer, partial_sums :: [integer]) :: integer
  def path_sum(root, target_sum, partial_sums \\ []) do
    new_partials = [root.val | Enum.map(partial_sums, &(&1 + root.val))]
    equal_path = Enum.count(Enum.filter(new_partials, &(&1 == target_sum)))
    equal_path + 
      path_sum(root.left, target_sum, new_partials) + 
      path_sum(root.right, target_sum, new_partials)
  end
end
