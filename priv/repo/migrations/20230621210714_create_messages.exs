defmodule ChatViewer.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :source_id, references(:facebook_dumps, on_delete: :nothing)
      add :sender_id, references(:people, on_delete: :nothing)
      add :content, :text
      add :sent_at, :utc_datetime
      add :edited_at, :utc_datetime
      add :reactions, :map

      timestamps()
    end

    create index(:messages, [:source_id])
    create index(:messages, [:sender_id])
  end
end
