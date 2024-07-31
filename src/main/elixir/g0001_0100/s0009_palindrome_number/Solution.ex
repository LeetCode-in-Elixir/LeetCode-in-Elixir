# #Easy #Math #Udemy_Integers #2024_07_31_Time_1007_ms_(87.50%)_Space_72_MB_(33.93%)

defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when x < 0, do: false
  def is_palindrome(x) when x < 10, do: true
  def is_palindrome(x) do
    reversed = x
    |> Integer.digits
    |> Enum.reverse
    |> Integer.undigits

    x == reversed
  end
end
