defmodule FlightBooking.Users.CreateOrUpdate do
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)

  defp save_user({:error, _reason} = error), do: error
end
