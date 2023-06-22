defmodule ChatViewer.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatViewer.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content",
        edited_at: ~U[2023-06-20 21:07:00Z],
        reactions: %{},
        sent_at: ~U[2023-06-20 21:07:00Z]
      })
      |> ChatViewer.Messages.create_message()

    message
  end
end
