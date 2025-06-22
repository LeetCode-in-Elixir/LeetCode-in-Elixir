# #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
# #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree
# #Top_Interview_150_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
# #2024_08_03_Time_286_ms_(66.67%)_Space_86.4_MB_(100.00%)

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
  @spec kth_smallest(root :: TreeNode.t() | nil, k :: integer) :: integer
  def kth_smallest(root, k) do
    {_, value} = find_kth_smallest(root, k, 0)
    value
  end

  defp find_kth_smallest(nil, _, count), do: {count, nil}

  defp find_kth_smallest(node, k, count) do
    # Search left subtree
    {count, left_value} = find_kth_smallest(node.left, k, count)
    
    # Check if we have found the k-th smallest element
    if left_value do
      {count, left_value}
    else
      count = count + 1
      
      if count == k do
        {count, node.val}
      else
        # Search right subtree
        find_kth_smallest(node.right, k, count)
      end
    end
  end
end
