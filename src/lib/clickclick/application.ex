defmodule ClickClick.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Bandit, plug: ClickClick.Router}
    ]

    opts = [strategy: :one_for_one, name: ClickClick.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
