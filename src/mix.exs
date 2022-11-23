defmodule Clickclick.MixProject do
  use Mix.Project

  def project do
    [
      app: :clickclick,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ClickClick.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.14"},
      {:bandit, "~> 0.6.0"}
    ]
  end
end
