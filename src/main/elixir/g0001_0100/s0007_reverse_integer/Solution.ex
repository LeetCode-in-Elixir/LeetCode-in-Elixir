# #Medium #Top_Interview_Questions #Math #Udemy_Integers
# #2024_07_31_Time_317_ms_(100.00%)_Space_72.1_MB_(27.27%)

defmodule Solution do
  @spec reverse(x :: integer) :: integer
  def reverse(x) do
    rev = reverse_digits(x, 0)
    if rev > :math.pow(2, 31) - 1 or rev < -(:math.pow(2, 31)) do
      0
    else
      rev
    end
  end

  defp reverse_digits(0, acc), do: acc

  defp reverse_digits(x, acc) do
    new_acc = (acc * 10) + rem(x, 10)
    reverse_digits(div(x, 10), new_acc)
  end
end
