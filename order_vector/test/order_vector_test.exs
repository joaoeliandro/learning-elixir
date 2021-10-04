defmodule OrderVectorTest do
  use ExUnit.Case
  doctest OrderVector

  @vector [1, 2, 7, 3, 4, 5]

  test "hello/0" do
    assert OrderVector.hello() == :world
  end

  test "show_vector/1" do
    assert OrderVector.show_vector(@vector) == @vector
  end

  test "remove_order_vector/2" do
    assert OrderVector.remove_order_vector(@vector, 2) == {:ok, [1, 7, 3, 4, 5]}
  end

  test "linear_find/2" do
    assert OrderVector.linear_find(@vector, 6) == 5
  end

  test "insert_vector/3" do
    assert OrderVector.insert_vector(@vector, 0, 8) == [8, 1, 2, 7, 3, 4, 5]
  end
end
