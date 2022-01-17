defmodule Bamboo.Counter do
  use GenServer

  alias Bamboo.Limits, as: Limits

  def start_link(%Limits{} = limits) do
    GenServer.start_link(__MODULE__, limits, user_name: String.to_atom(limits.user_name))
  end

  @impl true
  def init(%Limits{} = limits) do
    {:ok, limits}
  end

  @impl true
  def handle_call(:limits, _from, %Limits{} = limits) do
    {:reply, limits, limits}
  end

  @impl true
  def handle_cast({:add_cost, cost}, %Limits{} = limits) do
    {:noreply, %{limits | cost: limits.cost + cost, rate_limit: limits.rate_limits + 1}}
  end

  def stop(%Limits{} = limits) do
    GenServer.stop(limits.user_name)
  end
end
