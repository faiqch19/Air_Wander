defmodule AirWander.Trips.MutiCity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "multi_city" do
    field :input1, :string
    field :input2, :string
    field :input3, :string
  end

  # def changeset(%__MODULE__{} = multi_city, %{}) do
  #   changeset(multi_city, %{
  #     input1: "",
  #     input2: "",
  #     input3: ""
  #   })
  # end

  def changeset(%__MODULE__{} = multi_city, params \\ %{}) do
    multi_city
    |> cast(params, [:input1, :input2, :input3])
  end
end
