defmodule ChatViewer.SourcesTest do
  use ChatViewer.DataCase

  alias ChatViewer.Sources

  describe "facebook_dumps" do
    alias ChatViewer.Sources.FacebookDump

    import ChatViewer.SourcesFixtures

    @invalid_attrs %{name: nil, path: nil}

    test "list_facebook_dumps/0 returns all facebook_dumps" do
      facebook_dump = facebook_dump_fixture()
      assert Sources.list_facebook_dumps() == [facebook_dump]
    end

    test "get_facebook_dump!/1 returns the facebook_dump with given id" do
      facebook_dump = facebook_dump_fixture()
      assert Sources.get_facebook_dump!(facebook_dump.id) == facebook_dump
    end

    test "create_facebook_dump/1 with valid data creates a facebook_dump" do
      valid_attrs = %{name: "some name", path: "some path"}

      assert {:ok, %FacebookDump{} = facebook_dump} = Sources.create_facebook_dump(valid_attrs)
      assert facebook_dump.name == "some name"
      assert facebook_dump.path == "some path"
    end

    test "create_facebook_dump/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sources.create_facebook_dump(@invalid_attrs)
    end

    test "update_facebook_dump/2 with valid data updates the facebook_dump" do
      facebook_dump = facebook_dump_fixture()
      update_attrs = %{name: "some updated name", path: "some updated path"}

      assert {:ok, %FacebookDump{} = facebook_dump} = Sources.update_facebook_dump(facebook_dump, update_attrs)
      assert facebook_dump.name == "some updated name"
      assert facebook_dump.path == "some updated path"
    end

    test "update_facebook_dump/2 with invalid data returns error changeset" do
      facebook_dump = facebook_dump_fixture()
      assert {:error, %Ecto.Changeset{}} = Sources.update_facebook_dump(facebook_dump, @invalid_attrs)
      assert facebook_dump == Sources.get_facebook_dump!(facebook_dump.id)
    end

    test "delete_facebook_dump/1 deletes the facebook_dump" do
      facebook_dump = facebook_dump_fixture()
      assert {:ok, %FacebookDump{}} = Sources.delete_facebook_dump(facebook_dump)
      assert_raise Ecto.NoResultsError, fn -> Sources.get_facebook_dump!(facebook_dump.id) end
    end

    test "change_facebook_dump/1 returns a facebook_dump changeset" do
      facebook_dump = facebook_dump_fixture()
      assert %Ecto.Changeset{} = Sources.change_facebook_dump(facebook_dump)
    end
  end
end
