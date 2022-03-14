defmodule Airwander.Repo do
  use Ecto.Repo,
    otp_app: :airwander,
    adapter: Ecto.Adapters.Postgres
end
