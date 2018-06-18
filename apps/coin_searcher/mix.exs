defmodule CoinSearcher.MixProject do
  use Mix.Project

  def project do
    [
      app: :coin_searcher,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CoinSearcher.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0", override: true},
      {:nadia, "~> 0.4.3"},
      {:distillery, "~> 1.5", runtime: false}
    ]
  end
end
