defmodule ChatViewer.Repo do
  case System.get_env("DB_USE_SQLITE") do
    "1" ->
      use Ecto.Repo,
        otp_app: :chat_viewer,
        adapter: Ecto.Adapters.SQLite3
    _ ->

      use Ecto.Repo,
        otp_app: :chat_viewer,
        adapter: Ecto.Adapters.Postgres
  end
end
