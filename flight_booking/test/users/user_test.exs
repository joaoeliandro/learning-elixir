defmodule FlightBooking.Users.UserTest do
  use ExUnit.Case

  alias FlightBooking.Users.User

  import FlightBooking.Factory

  describe "build/4" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "John doe",
          "johndoe@example.com",
          "12345678900"
        )

      {_ok, id} = response

      expected_response = {:ok, build(:users, id: id.id)}

      assert response == expected_response
    end

    test "when cpf is a integer" do
      response =
        User.build(
          "John doe",
          "johndoe@example.com",
          112_250_055
        )

      expected_response = {:error, "Cpf must be a string"}

      assert response == expected_response
    end

    test "when reached 2 params" do
      response =
        User.build(
          "John doe",
          "johndoe@example.com"
        )

      expected_response = {:error, "Incomplete parameters"}

      assert response == expected_response
    end

    test "when reached 1 params" do
      response = User.build("John")

      expected_response = {:error, "Incomplete parameters"}

      assert response == expected_response
    end

    test "when no reached params" do
      response = User.build()

      expected_response = {:error, "Parameters not found"}

      assert response == expected_response
    end
  end
end
