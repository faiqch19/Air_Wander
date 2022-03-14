defmodule AirWander.Trips.RoundTrip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "round_trip" do
    field :input1, :string
    field :input2, :string
    field :input3, :string
  end

  def changeset(%__MODULE__{} = round_trip, params \\ %{}) do
    round_trip
    |> cast(params, [:input1, :input2, :input3])
  end
end
