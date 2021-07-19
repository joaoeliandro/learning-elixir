defmodule FlightBooking.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias FlightBooking.Users.{Agent, CreateOrUpdate}

  describe "call/1" do
    setup do
      Agent.start_link(%{})

      :ok
    end

    test "when all params are valid, returns an :ok" do
      params = %{
        name: "John doe",
        email: "johndoe@example.com",
        cpf: "12345678900"
      }

      expected_response = :ok

      response = CreateOrUpdate.call(params)

      assert response == expected_response
    end

    test "when cpf is a integer, returns an error" do
      params = %{
        name: "John doe",
        email: "johndoe@example.com",
        cpf: 12_345_678_900
      }

      expected_response = {:error, "Cpf must be a string"}

      response = CreateOrUpdate.call(params)

      assert response == expected_response
    end
  end
end
