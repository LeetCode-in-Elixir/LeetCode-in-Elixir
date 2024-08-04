# #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #Data_Structure_II_Day_5_Array #Udemy_Arrays
# #Big_O_Time_O(n^2)_Space_O(n) #2024_08_03_Time_362_ms_(85.71%)_Space_121.8_MB_(14.29%)

defmodule Solution do
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self(nums) do
    elem(pes(nums, 1), 0)
  end

  def pes([], _), do: {[], 1}
  
  # cur_prod is an accumulator to keep track of product 
  # of all elements we've seen 
  @spec pes(nums :: [integer], cur_prod :: integer) :: {[integer], integer}
  def pes([num | nums], cur_prod) do
    {pes_list, next_prod} = pes(nums, cur_prod * num)

    # cur_prod * next_prod is the product of all elements in list
    # except the current element `num`. We also return num * next_prod
    # so previous recursive calls of this fn can have the product of all
    # elements in the list after them.
    {[cur_prod * next_prod | pes_list], num * next_prod}
  end
end
