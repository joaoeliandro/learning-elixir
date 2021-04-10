defmodule SumList do
  def call(list), do: sum(list, 0)

  def call_enum(list), do: Enum.sum(list)

  defp sum([], accumulator), do: accumulator

  defp sum([head | tail], accumulator) do
    accumulator = accumulator + head
    sum(tail, accumulator)
  end
end
