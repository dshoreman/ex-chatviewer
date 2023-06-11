defmodule ChatViewer.ChatsTest do
  use ChatViewer.DataCase

  alias ChatViewer.Chats

  describe "people" do
    alias ChatViewer.Chats.Participant

    import ChatViewer.ChatsFixtures

    @invalid_attrs %{discord_avatar: nil, discord_id: nil, discord_name: nil, facebook_id: nil, facebook_name: nil, facebook_slug: nil, name: nil}

    test "list_people/0 returns all people" do
      participant = participant_fixture()
      assert Chats.list_people() == [participant]
    end

    test "get_participant!/1 returns the participant with given id" do
      participant = participant_fixture()
      assert Chats.get_participant!(participant.id) == participant
    end

    test "create_participant/1 with valid data creates a participant" do
      valid_attrs = %{discord_avatar: "some discord_avatar", discord_id: "some discord_id", discord_name: "some discord_name", facebook_id: "some facebook_id", facebook_name: "some facebook_name", facebook_slug: "some facebook_slug", name: "some name"}

      assert {:ok, %Participant{} = participant} = Chats.create_participant(valid_attrs)
      assert participant.discord_avatar == "some discord_avatar"
      assert participant.discord_id == "some discord_id"
      assert participant.discord_name == "some discord_name"
      assert participant.facebook_id == "some facebook_id"
      assert participant.facebook_name == "some facebook_name"
      assert participant.facebook_slug == "some facebook_slug"
      assert participant.name == "some name"
    end

    test "create_participant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_participant(@invalid_attrs)
    end

    test "update_participant/2 with valid data updates the participant" do
      participant = participant_fixture()
      update_attrs = %{discord_avatar: "some updated discord_avatar", discord_id: "some updated discord_id", discord_name: "some updated discord_name", facebook_id: "some updated facebook_id", facebook_name: "some updated facebook_name", facebook_slug: "some updated facebook_slug", name: "some updated name"}

      assert {:ok, %Participant{} = participant} = Chats.update_participant(participant, update_attrs)
      assert participant.discord_avatar == "some updated discord_avatar"
      assert participant.discord_id == "some updated discord_id"
      assert participant.discord_name == "some updated discord_name"
      assert participant.facebook_id == "some updated facebook_id"
      assert participant.facebook_name == "some updated facebook_name"
      assert participant.facebook_slug == "some updated facebook_slug"
      assert participant.name == "some updated name"
    end

    test "update_participant/2 with invalid data returns error changeset" do
      participant = participant_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_participant(participant, @invalid_attrs)
      assert participant == Chats.get_participant!(participant.id)
    end

    test "delete_participant/1 deletes the participant" do
      participant = participant_fixture()
      assert {:ok, %Participant{}} = Chats.delete_participant(participant)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_participant!(participant.id) end
    end

    test "change_participant/1 returns a participant changeset" do
      participant = participant_fixture()
      assert %Ecto.Changeset{} = Chats.change_participant(participant)
    end
  end
end
