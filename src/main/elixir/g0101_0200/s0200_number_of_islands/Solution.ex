# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
# #Breadth_First_Search #Matrix #Union_Find
# #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
# #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
# #Top_Interview_150_Graph_General #Big_O_Time_O(M*N)_Space_O(M*N)
# #2024_08_03_Time_463_ms_(100.00%)_Space_133.1_MB_(100.00%)

defmodule Solution do
  @spec num_islands(grid :: [[char]]) :: integer
  def num_islands(grid) do
    lands = grid |> Enum.with_index() |> Enum.reduce(MapSet.new(), fn {line, i}, lands ->
      line |> Enum.with_index() |> Enum.reduce(lands, fn {is_land?, j}, lands ->
        if is_land? == ?0 do
          lands
        else
          MapSet.put(lands, {i, j})
        end
      end)
    end)

    lands |> Enum.reduce({MapSet.new(), 0}, fn land, {visited, count}->
      if MapSet.member?(visited, land) do
        {visited, count}
      else
        visited = visit_island(visited, lands, land)
        {visited, count + 1}
      end
    end) |> elem(1)
  end

  defp visit_island(visited, lands, {i, j} = land) do
    with true <- MapSet.member?(lands, land),
         false <- MapSet.member?(visited, land) do
      visited
      |> MapSet.put(land)
      |> visit_island(lands, {i - 1, j})
      |> visit_island(lands, {i + 1, j})
      |> visit_island(lands, {i, j - 1})
      |> visit_island(lands, {i, j + 1})
    else
      _ -> visited
    end
  end
end
