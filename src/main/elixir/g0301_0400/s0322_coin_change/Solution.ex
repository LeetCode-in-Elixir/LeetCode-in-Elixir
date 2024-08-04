# #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
# #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
# #Level_2_Day_12_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(amount)
# #2024_08_04_Time_1402_ms_(100.00%)_Space_75.3_MB_(100.00%)

defmodule Solution do
  @spec coin_change(coins :: [integer], amount :: integer) :: integer
  def coin_change(coins, amount) do
    coins = Enum.sort(coins)

    for a <- 1..amount, reduce: %{0 => 0} do
      dp ->
        coins
        |> Enum.reduce_while(dp, fn c, dp ->
          cond do
            c > a ->
              {:halt, dp}

            dp[a - c] != nil ->
              {:cont, Map.update(dp, a, dp[a - c] + 1, &min(&1, dp[a - c] + 1))}

            true ->
              {:cont, dp}
          end
        end)
    end
    |> Map.get(amount, -1)
  end
end
