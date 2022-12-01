defmodule SignalServerWeb.SignalSocket do
  require Logger

  @behaviour Phoenix.Socket.Transport

  @impl true
  def child_spec(_opts) do
    %{id: __MODULE__, start: {Task, :start_link, [fn -> :ok end]}, restart: :transient}
  end

  @impl true
  def init(_args) do
    {:ok, %{}}
  end

  @impl true
  def connect(_transport_info) do
    Logger.info("Connected to #{inspect(__MODULE__)}")
    {:ok, %{}}
  end

  @impl true
  def handle_in({payload, [opcode: :text]}, state) do
    payload
    |> Jason.decode!()
    |> handle_message()

    {:reply, :ok, {:text, "OK"}, state}
  end

  def handle_in({_payload, _, state}) do
    {:ok, state}
  end

  @impl true
  def handle_info(_message, state) do
    {:ok, state}
  end

  @impl true
  def terminate(_reason, _state) do
    :ok
  end

  defp handle_message(message) do
    IO.inspect(message)
  end
end
