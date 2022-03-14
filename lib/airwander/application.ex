defmodule Airwander.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Airwander.Repo,
      # Start the Telemetry supervisor
      AirwanderWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Airwander.PubSub},
      # Start the Endpoint (http/https)
      AirwanderWeb.Endpoint
      # Start a worker by calling: Airwander.Worker.start_link(arg)
      # {Airwander.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Airwander.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AirwanderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
