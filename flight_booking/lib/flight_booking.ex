defmodule FlightBooking do
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.CreateOrUpdate, as: CreateOrUpdateUser

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.CreateOrUpdate, as: CreateOrUpdateBookings

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call

  defdelegate create_or_update_booking(params), to: CreateOrUpdateBookings, as: :call
end
