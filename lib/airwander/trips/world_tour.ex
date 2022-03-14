defmodule AirWander.Trips.WorldTour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "world_tour" do
    field :input1, :string
    field :input2, :string
    field :input3, :string
    field :input4, :string
  end

  def changeset(%__MODULE__{} = world_tour, params \\ %{}) do
    world_tour
    |> cast(params, [:input1, :input2, :input3, :input4])
  end
end
