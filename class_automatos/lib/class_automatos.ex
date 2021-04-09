defmodule ClassAutomatos do
  def afd(value_string) do
    symbol = String.match?(value_string, ~r/[.,]/)

    if !symbol do
      {:error, "unmatched symbol"}
    else
      list_values = String.split(value_string, ~r/\D/)

      first_value =
        list_values
        |> List.first()
        |> Integer.parse()
        |> is_valid()

      last_value =
        list_values
        |> List.last()
        |> Integer.parse()
        |> is_valid()

      if first_value and last_value do
        {:ok, "matched values"}
      else
        if !first_value and last_value do
          {:ok, "matched values"}
        else
          {:error, "unmatched values"}
        end
      end
    end
  end

  defp is_valid({number, _}), do: is_integer(number)
  defp is_valid(:error), do: false
end
