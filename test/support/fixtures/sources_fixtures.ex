defmodule ChatViewer.SourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatViewer.Sources` context.
  """

  @doc """
  Generate a facebook_dump.
  """
  def facebook_dump_fixture(attrs \\ %{}) do
    {:ok, facebook_dump} =
      attrs
      |> Enum.into(%{
        name: "some name",
        path: "some path"
      })
      |> ChatViewer.Sources.create_facebook_dump()

    facebook_dump
  end
end
