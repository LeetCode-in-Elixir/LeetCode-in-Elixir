# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
# #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
# #Big_O_Time_O(4^n)_Space_O(n) #2024_07_31_Time_279_ms_(100.00%)_Space_72_MB_(100.00%)

defmodule Solution do
  @t9 (Enum.chunk_every(?a..?o, 3) ++ [~c"pqrs", ~c"tuv", ~c"wxyz"])
      |> Enum.with_index(2)
      |> Map.new(fn {a, n} -> {n, a} end)

  @spec letter_combinations(digits :: String.t()) :: [String.t()]
  def letter_combinations(""), do: []

  def letter_combinations(digits) do
    digits
    |> String.to_integer()
    |> Integer.digits()
    |> Enum.map(&Map.get(@t9, &1))
    |> Enum.reduce([~c""], fn l, acc ->
      for x <- acc,
          y <- l do
        x ++ [y]
      end
    end)
    |> Enum.map(&to_string/1)
  end
end
