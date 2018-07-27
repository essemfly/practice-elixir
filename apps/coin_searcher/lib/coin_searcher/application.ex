defmodule CoinSearcher.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # %{
      #   id: UpbitNumberRun,
      #   start: {Task, :start_link, [CoinSearcher, :upbit_number_run, [34]]}
      # },
      # %{
      #   id: UpbitNamesRun,
      #   start: {Task, :start_link, [CoinSearcher, :upbit_name_run, []]}
      # }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoinSearcher.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
