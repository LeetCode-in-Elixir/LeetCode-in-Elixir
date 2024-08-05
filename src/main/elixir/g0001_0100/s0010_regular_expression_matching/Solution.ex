# #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
# #Big_O_Time_O(m*n)_Space_O(m*n) #2024_07_31_Time_296_ms_(100.00%)_Space_71.7_MB_(9.09%)

defmodule Solution do
  @cache Agent

  @spec is_match(s :: String.t, p :: String.t) :: boolean
  def is_match(s, p) do
    :ets.new(:cache, [:named_table, :set, {:read_concurrency, true}])
    result = is_match(s, p, 0, 0)
    :ets.delete(:cache)
    result
  end

  defp is_match(s, p, i, j) do
    case :ets.lookup(:cache, {i, j}) do
      [{_, result}] -> result
      [] ->
        result = 
          if j == String.length(p) do
            i == String.length(s)
          else
            first_match = i < String.length(s) && (String.at(s, i) == String.at(p, j) || String.at(p, j) == ".")
            if (j + 1) < String.length(p) && String.at(p, j + 1) == "*" do
              (first_match && is_match(s, p, i + 1, j)) || is_match(s, p, i, j + 2)
            else
              first_match && is_match(s, p, i + 1, j + 1)
            end
          end

        :ets.insert(:cache, { {i, j}, result})
        result
    end
  end
end
