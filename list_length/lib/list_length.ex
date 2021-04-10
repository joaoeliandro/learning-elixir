defmodule ListLength do
  def call(list), do: count_list(list, 0)

  defp count_list([], acc), do: acc

  defp count_list([_ | tail], acc) do
    acc = acc + 1
    count_list(tail, acc)
  end
end
