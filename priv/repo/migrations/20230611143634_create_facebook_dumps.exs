defmodule ChatViewer.Repo.Migrations.CreateFacebookDumps do
  use Ecto.Migration

  def change do
    create table(:facebook_dumps) do
      add :user_id, references(:users, on_delete: :nothing)
      add :name, :string
      add :path, :string

      timestamps()
    end

    create index(:facebook_dumps, [:user_id])
  end
end
