defmodule FlightBooking.Bookings.AgentTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Agent, as: BookingsAgent
  alias FlightBooking.Bookings.Booking

  describe "save/1" do
    setup do
      BookingsAgent.start_link(%{})

      :ok
    end

    test "when the param are valid, return a booking uuid" do
      response = BookingsAgent.save(build(:booking))
      {_ok, uuid} = response

      assert response == {:ok, uuid}
    end
  end

  describe "get/1" do
    setup do
      BookingsAgent.start_link(%{})

      :ok

      id = UUID.uuid4()
      {:ok, id: id}
    end

    test "when the user is found, return a booking", %{id: id} do
      booking = build(:booking, id: id)
      {:ok, uuid} = BookingsAgent.save(booking)

      response = BookingsAgent.get(uuid)

      expected_response =
        {:ok,
         %Booking{
           complete_date: {:ok, ~N[1998-06-23 05:00:00]},
           id: id,
           local_destination: "Nova Parnamirim",
           local_origin: "Natal",
           user_id: "12345678900"
         }}

      assert response == expected_response
    end

    test "when the user is't founded, return an error", %{id: id} do
      booking = build(:booking, id: id)
      {:ok, _uuid} = BookingsAgent.save(booking)

      response = BookingsAgent.get("banana")

      expected_response = {:error, "Booking not found"}

      assert response == expected_response
    end
  end
end
