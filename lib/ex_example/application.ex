defmodule ExExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    unless Mix.env() == :prod do
      Dotenv.load()
      Mix.Task.run("loadconfig")
    end

    children = [
      # Start the Ecto repository
      ExExample.Repo,
      # Start the Telemetry supervisor
      ExExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExExample.PubSub},
      # Start the Endpoint (http/https)
      ExExampleWeb.Endpoint
      # Start a worker by calling: ExExample.Worker.start_link(arg)
      # {ExExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ExExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
