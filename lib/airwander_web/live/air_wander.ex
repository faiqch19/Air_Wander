defmodule AirwanderWeb.AirWander do
  use AirwanderWeb, :live_view

  alias AirWander.Trips

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_form, nil)
      |> assign(:selected, "Type of trip")

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="icon-box d-flex flex-row justify-content-center mt-4">
        <h3><a href="">Air Wander 0.01</a></h3>
      </div>

      <form phx-change="change" class="mt-4 d-flex flex-column align-items-center">
        <div class="mb-4 w-50">
          <%= select :select, :type_of_trip, ["Type of trip", "One-Way", "Round-Trip", "Multi-City", "World-Tour"], selected: @selected, class: "form-select text-center"%>
        </div>

        <div class="d-flex flex-row justify-content-center">
          <%= if is_nil(@page_form) do %>
            <div class="d-flex">
              <%= text_input :text, :for, class: "form-control w-50 mx-2" %>
              <%= text_input :text, :for, class: "form-control w-50 mx-2" %>
            </div>
          <% else %>
            <.form let={f} for={@page_form.changeset} as={@page_form.as}>
              <%= for x <- 1..@page_form.fields do %>
                <%= text_input f, :"input#{x}", placeholder: "Input ##{x}", class: "form-control w-50 mx-2" %>
              <% end %>
            </.form>
          <% end %>
        </div>
      </form>
    """
  end

  def handle_event("change", %{"_target" => ["Round-Trip", "input1"]} = params, socket) do
    new_params = Map.get(params, "Round-Trip")

    page_form = changeset_for("Round-Trip", %{new_params | "input3" => new_params["input1"]})
    IO.inspect(page_form)

    socket =
      socket
      |> assign(:page_form, page_form)
      |> assign(:selected, "Round-Trip")

    {:noreply, socket}
  end

  def handle_event("change", %{"_target" => ["select", "type_of_trip"]} = params, socket) do
    page_form =
      params["select"]["type_of_trip"]
      |> changeset_for()

    socket =
      socket
      |> assign(:page_form, page_form)

    {:noreply, socket}
  end

  def handle_event("change", _, socket), do: {:noreply, socket}

  defp changeset_for(as, params \\ %{})

  defp changeset_for("One-Way" = as, _) do
    %{
      changeset: Trips.one_way_changeset(%Trips.OneWay{}),
      fields: 2,
      as: as
    }
  end

  defp changeset_for("Multi-City" = as, _) do
    %{
      changeset: Trips.multi_city_changeset(%Trips.MutiCity{}),
      fields: 3,
      as: as
    }
  end

  defp changeset_for("Round-Trip" = as, params) do
    %{
      changeset: Trips.round_trip_changeset(%Trips.RoundTrip{}, params),
      fields: 3,
      as: as
    }
  end

  defp changeset_for("World-Tour" = as, _) do
    %{
      changeset: Trips.world_tour_changeset(%Trips.WorldTour{}),
      fields: 4,
      as: as
    }
  end

  defp changeset_for(_, _), do: nil
end
