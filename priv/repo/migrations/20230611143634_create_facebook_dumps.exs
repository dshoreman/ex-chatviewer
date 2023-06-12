defmodule ChatViewer.Repo.Migrations.CreateFacebookDumps do
  use Ecto.Migration

  def change do
    create table(:facebook_dumps) do
      add :name, :string
      add :path, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:facebook_dumps, [:user_id])
  end
end
