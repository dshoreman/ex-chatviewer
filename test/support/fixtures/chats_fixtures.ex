defmodule ChatViewer.ChatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatViewer.Chats` context.
  """

  @doc """
  Generate a participant.
  """
  def participant_fixture(attrs \\ %{}) do
    {:ok, participant} =
      attrs
      |> Enum.into(%{
        discord_avatar: "some discord_avatar",
        discord_id: "some discord_id",
        discord_name: "some discord_name",
        facebook_id: "some facebook_id",
        facebook_name: "some facebook_name",
        facebook_slug: "some facebook_slug",
        name: "some name"
      })
      |> ChatViewer.Chats.create_participant()

    participant
  end
end
