defmodule FlightBooking.Bookings.CreateOrUpdateTest do
  use ExUnit.Case, async: false

  alias FlightBooking.Bookings.{Agent, CreateOrUpdate}

  describe "call/1" do
    setup do
      Agent.start_link(%{})

      :ok
    end

    test "when all params are valid, returns an :ok and booking uuid" do
      params = %{
        complete_date: [1998, 6, 23, 5, 0, 0],
        local_origin: "Natal",
        local_destination: "Nova Parnamirim",
        user_id: "12345678900",
        id: UUID.uuid4()
      }

      response = CreateOrUpdate.call(params)

      {_ok, uuid} = response

      assert response == {:ok, uuid}
    end
  end
end
