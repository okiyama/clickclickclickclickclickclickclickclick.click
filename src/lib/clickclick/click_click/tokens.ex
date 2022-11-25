defmodule ClickClick.Tokens do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{:total => 0} end, name: __MODULE__)
  end

  def get(id) do
    Agent.get(__MODULE__, &Map.get(&1, id))
  end

  def increment(id) do
#    Agent.update(__MODULE__, &Map.put(&1, :total, get(:total) + 1))
    new_total = Agent.get(__MODULE__, &Map.get(&1, id) + 1)
    Agent.update(__MODULE__, &Map.put(&1, id,  new_total))
  end

  def init_if_not_exists(id) do
    Agent.update(__MODULE__, &Map.put_new(&1, id, 1))
  end

  def ban(id) do
    if id != :total do
      Agent.update(__MODULE__, &Map.put(&1, id, -1))
    end
  end

  def is_banned(id) do
    get(id) < 0
  end
end
