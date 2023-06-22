defmodule ChatViewer.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :source_id, :id
    field :sender_id, :id
    field :content, :string
    field :sent_at, :utc_datetime
    field :edited_at, :utc_datetime
    field :reactions, :map

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :reactions, :sent_at, :edited_at])
    |> validate_required([:content, :reactions, :sent_at, :edited_at])
  end
end
