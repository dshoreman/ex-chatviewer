defmodule ChatViewer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ChatViewerWeb.Telemetry,
      # Start the Ecto repository
      ChatViewer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChatViewer.PubSub},
      # Start Finch
      {Finch, name: ChatViewer.Finch},
      # Start the Endpoint (http/https)
      ChatViewerWeb.Endpoint
      # Start a worker by calling: ChatViewer.Worker.start_link(arg)
      # {ChatViewer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatViewer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatViewerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
