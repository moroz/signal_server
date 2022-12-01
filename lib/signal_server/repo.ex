defmodule SignalServer.Repo do
  use Ecto.Repo,
    otp_app: :signal_server,
    adapter: Ecto.Adapters.Postgres
end
