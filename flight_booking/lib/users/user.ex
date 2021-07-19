defmodule FlightBooking.Users.User do
  @keys [:name, :email, :cpf, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf) when is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email, cpf) when is_integer(cpf),
    do: {:error, "Cpf must be a string"}

  def build(_name, _email, _cpf), do: {:error, "Invalid Parameters"}
  def build(_name, _email), do: {:error, "Incomplete parameters"}
  def build(_name), do: {:error, "Incomplete parameters"}
  def build(), do: {:error, "Parameters not found"}
end
