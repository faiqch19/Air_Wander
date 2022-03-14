defmodule AirWander.Trips.OneWay do
  use Ecto.Schema
  import Ecto.Changeset

  schema "one_way" do
    field :input1, :string
    field :input2, :string
  end

  def changeset(%__MODULE__{} = one_way, params \\ %{}) do
    one_way
    |> cast(params, [:input1, :input2])
  end
end
