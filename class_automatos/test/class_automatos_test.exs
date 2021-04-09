defmodule ClassAutomatosTest do
  use ExUnit.Case
  doctest ClassAutomatos

  test "should be able to return matched" do
    assert ClassAutomatos.afd(",14") == {:ok, "matched values"}
    assert ClassAutomatos.afd("3,14") == {:ok, "matched values"}
    assert ClassAutomatos.afd("331.0") == {:ok, "matched values"}
    assert ClassAutomatos.afd("32,1433") == {:ok, "matched values"}
  end

  test "should not be able to return matched without symbol" do
    assert ClassAutomatos.afd("314") == {:error, "unmatched symbol"}
  end

  test "should not be able to return matched" do
    assert ClassAutomatos.afd("3,a") == {:error, "unmatched values"}
  end
end
