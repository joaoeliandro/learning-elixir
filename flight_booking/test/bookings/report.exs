defmodule FlightBooking.Bookings.ReportTest do
  use ExUnit.Case

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Report

  describe "generate/1" do
    test "when called, return :ok" do
      BookingAgent.start_link(%{})

      FlightBooking.create_or_update_booking(%{
        complete_date: {:ok, ~N[1998-06-23 05:00:00]},
        local_origin: "Natal",
        local_destination: "Nova Parnamirim",
        user_id: "12345678900",
        id: UUID.uuid4()
      })

      response = Report.generate("report_test.csv")

      assert response == {:ok, "Report created"}
    end
  end
end
