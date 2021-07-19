defmodule FlightBooking.Factory do
  use ExMachina

  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Users.User

  def users_factory do
    %User{
      id: UUID.uuid4(),
      name: "John doe",
      email: "johndoe@example.com",
      cpf: "12345678900"
    }
  end

  def booking_factory do
    %Booking{
      complete_date: {:ok, ~N[1998-06-23 05:00:00]},
      local_origin: "Natal",
      local_destination: "Nova Parnamirim",
      user_id: "12345678900",
      id: UUID.uuid4()
    }
  end
end
