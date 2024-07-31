# #Medium #Top_Interview_Questions #String #2024_07_31_Time_352_ms_(55.56%)_Space_72.2_MB_(77.78%)

defmodule Solution do
  @spec my_atoi(s :: String.t) :: integer
  def my_atoi(s) do
    result = s
          |> String.trim
          |> String.split
          |> List.first

    if result != nil and Integer.parse(result) != :error do
      {num,_} = Integer.parse(result)
      cond do
        num < -2 ** 31 -> -2 ** 31
        num > 2 ** 31 - 1 -> 2 ** 31 - 1
        true  -> num
      end
    else
      0
    end
  end

end
