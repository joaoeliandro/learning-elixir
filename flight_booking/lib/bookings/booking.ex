defmodule FlightBooking.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(naiveTime, local_origin, local_destination, user_id) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       complete_date: naiveTime,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: user_id
     }}
  end

  def build(_complete_date, _local_origin, _local_destination),
    do: {:error, "Incomplete parameters"}

  def build(_complete_date, _local_origin), do: {:error, "Incomplete parameters"}
  def build(_complete_date), do: {:error, "Incomplete parameters"}
  def build(), do: {:error, "Parameters not found"}
end
