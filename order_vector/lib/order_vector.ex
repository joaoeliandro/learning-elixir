defmodule OrderVector do
  @spec hello :: :world
  def hello do
    :world
  end

  @spec linear_find(list, integer) :: nil | non_neg_integer
  def linear_find(vector, value) do
    sorted_vector =
      vector
      |> sorted_vector()

    Enum.find_index(sorted_vector, fn elem -> elem > value || elem == nil end)
  end

  defp sorted_vector(vector), do: Enum.sort(vector)

  @spec show_vector(list) :: :ok
  def show_vector(vector) do
    IO.puts(vector)
    vector
  end

  @spec insert_vector(list, integer, integer) :: [...]
  def insert_vector(vector, index, value) do
    List.insert_at(vector, index, value)
  end

  defp find_remove(vector, value) do
    List.delete(vector, value)
  end

  @spec remove_order_vector(list, integer) :: {:error, <<_::88>>} | {:ok, [...]}
  def remove_order_vector(vector, value) do
    new_vector = find_remove(vector, value)

    case new_vector do
      [] -> {:error, "Null vector"}
      _ -> {:ok, new_vector}
    end
  end
end
