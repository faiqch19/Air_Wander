defmodule AirWander.Trips do
  alias AirWander.Trips.{OneWay, MutiCity, RoundTrip, WorldTour}

  defdelegate one_way_changeset(one_way, params \\ %{}), to: OneWay, as: :changeset
  defdelegate multi_city_changeset(multi_city, params \\ %{}), to: MutiCity, as: :changeset
  defdelegate round_trip_changeset(round_trip, params \\ %{}), to: RoundTrip, as: :changeset
  defdelegate world_tour_changeset(world_tour, params \\ %{}), to: WorldTour, as: :changeset
end
