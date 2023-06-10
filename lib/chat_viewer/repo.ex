defmodule ChatViewer.Repo do
  use Ecto.Repo,
    otp_app: :chat_viewer,
    adapter: Ecto.Adapters.Postgres
end
