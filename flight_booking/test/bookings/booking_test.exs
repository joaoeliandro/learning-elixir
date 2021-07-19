defmodule FlightBooking.Bookings.BookingTest do
  use ExUnit.Case, async: false

  alias FlightBooking.Bookings.Booking

  describe "build/4" do
    test "when all params are valid, returns a booking" do
      response =
        Booking.build(
          {:ok, ~N[1998-06-23 01:46:20]},
          "Natal",
          "Nova Parnamirim",
          "12345678900"
        )

      {_ok, booking} = response

      expected_response =
        {:ok,
         %Booking{
           complete_date: {:ok, ~N[1998-06-23 01:46:20]},
           id: booking.id,
           local_destination: "Nova Parnamirim",
           local_origin: "Natal",
           user_id: "12345678900"
         }}

      assert response == expected_response
    end

    test "when have 3 params, returns an error" do
      response =
        Booking.build(
          {:ok, ~N[1998-06-23 01:46:20]},
          "Natal",
          "Nova Parnamirim"
        )

      assert response == {:error, "Incomplete parameters"}
    end

    test "when have 2 params, returns an error" do
      response =
        Booking.build(
          [1998, 6, 23, 1, 46, 20],
          "Natal"
        )

      assert response == {:error, "Incomplete parameters"}
    end

    test "when have 1 params, returns an error" do
      response = Booking.build([1998, 6, 23, 1, 46, 20])

      assert response == {:error, "Incomplete parameters"}
    end

    test "when no have params, returns an error" do
      response = Booking.build()

      assert response == {:error, "Parameters not found"}
    end
  end
end
