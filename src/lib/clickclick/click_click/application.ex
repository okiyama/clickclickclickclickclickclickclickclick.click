defmodule ClickClick.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Bandit, plug: ClickClick.Router},
      ClickClick.Tokens
    ]

    Supervisor.start_link(children, strategy: :one_for_all)
  end
end
