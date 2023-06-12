defmodule ChatViewer.Sources.FacebookDump do
  use Ecto.Schema
  import Ecto.Changeset

  schema "facebook_dumps" do
    field :name, :string
    field :path, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(facebook_dump, attrs) do
    facebook_dump
    |> cast(attrs, [:name, :path])
    |> validate_required([:name, :path])
  end
end
