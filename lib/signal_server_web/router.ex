defmodule SignalServerWeb.Router do
  use SignalServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SignalServerWeb do
    pipe_through :api
  end
end
