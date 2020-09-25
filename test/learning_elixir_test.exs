defmodule LearningElixirTest do
  use ExUnit.Case
  doctest LearningElixir

  test "adding numbers" do
    assert LearningElixir.add(1, 2) == 3
    assert LearningElixir.add(3, 2) == 5
  end

  test "subtracting numbers" do
    assert LearningElixir.subtract(2, 2) == 0
    assert LearningElixir.subtract(3, 2) == 1
  end
end
