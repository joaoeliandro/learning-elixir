defmodule ListFilter do
  require Integer

  def call(list), do: filter_list(list)

  defp filter_list(list) do
    odds =
      Enum.filter(list, fn elem ->
        Integer.parse(elem)
        |> is_valid()
      end)

    Enum.count(odds)
  end

  defp is_valid({number, _}), do: Integer.is_odd(number)

  defp is_valid(:error), do: false
end
