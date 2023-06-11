defmodule ChatViewer.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :facebook_name, :string
      add :facebook_id, :string
      add :facebook_slug, :string
      add :discord_name, :string
      add :discord_id, :string
      add :discord_avatar, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:people, [:user_id])
  end
end
