# #Easy #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
# #Data_Structure_I_Day_12_Tree #Level_2_Day_6_Tree #Udemy_Tree_Stack_Queue
# #Big_O_Time_O(n)_Space_O(n) #2024_08_03_Time_233_ms_(100.00%)_Space_72.2_MB_(50.00%)

defmodule Solution do
  @spec invert_tree(root :: TreeNode.t | nil) :: TreeNode.t | nil
  def invert_tree(%TreeNode{val: v, left: left, right: right}) do
    %TreeNode{val: v, left: invert_tree(right), right: invert_tree(left)}
  end
  def invert_tree(nil), do: nil
end
