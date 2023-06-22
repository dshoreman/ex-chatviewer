defmodule ChatViewer.Chats.Participant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string
    field :user_id, :id
    field :facebook_id, :string
    field :facebook_name, :string
    field :facebook_slug, :string
    field :discord_id, :string
    field :discord_name, :string
    field :discord_avatar, :string

    timestamps()
  end

  @doc false
  def changeset(participant, attrs) do
    participant
    |> cast(attrs, [:name, :facebook_name, :facebook_id, :facebook_slug, :discord_name, :discord_id, :discord_avatar])
    |> validate_required([:name, :facebook_name, :facebook_id, :facebook_slug, :discord_name, :discord_id, :discord_avatar])
  end
end
