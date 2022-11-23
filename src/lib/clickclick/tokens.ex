defmodule ClickClick.Tokens do
  use Agent, restart: :transient

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  def put_new(key, value) do
    Agent.update(__MODULE__, &Map.put_new(&1, key, value))
  end

  def ban(id) do
    put(id, -1)
  end
end
