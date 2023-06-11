defmodule ChatViewerWeb.ParticipantControllerTest do
  use ChatViewerWeb.ConnCase

  import ChatViewer.ChatsFixtures

  @create_attrs %{discord_avatar: "some discord_avatar", discord_id: "some discord_id", discord_name: "some discord_name", facebook_id: "some facebook_id", facebook_name: "some facebook_name", facebook_slug: "some facebook_slug", name: "some name"}
  @update_attrs %{discord_avatar: "some updated discord_avatar", discord_id: "some updated discord_id", discord_name: "some updated discord_name", facebook_id: "some updated facebook_id", facebook_name: "some updated facebook_name", facebook_slug: "some updated facebook_slug", name: "some updated name"}
  @invalid_attrs %{discord_avatar: nil, discord_id: nil, discord_name: nil, facebook_id: nil, facebook_name: nil, facebook_slug: nil, name: nil}

  describe "index" do
    test "lists all people", %{conn: conn} do
      conn = get(conn, ~p"/people")
      assert html_response(conn, 200) =~ "Listing People"
    end
  end

  describe "new participant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/people/new")
      assert html_response(conn, 200) =~ "New Participant"
    end
  end

  describe "create participant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/people", participant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/people/#{id}"

      conn = get(conn, ~p"/people/#{id}")
      assert html_response(conn, 200) =~ "Participant #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/people", participant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Participant"
    end
  end

  describe "edit participant" do
    setup [:create_participant]

    test "renders form for editing chosen participant", %{conn: conn, participant: participant} do
      conn = get(conn, ~p"/people/#{participant}/edit")
      assert html_response(conn, 200) =~ "Edit Participant"
    end
  end

  describe "update participant" do
    setup [:create_participant]

    test "redirects when data is valid", %{conn: conn, participant: participant} do
      conn = put(conn, ~p"/people/#{participant}", participant: @update_attrs)
      assert redirected_to(conn) == ~p"/people/#{participant}"

      conn = get(conn, ~p"/people/#{participant}")
      assert html_response(conn, 200) =~ "some updated discord_avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, participant: participant} do
      conn = put(conn, ~p"/people/#{participant}", participant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Participant"
    end
  end

  describe "delete participant" do
    setup [:create_participant]

    test "deletes chosen participant", %{conn: conn, participant: participant} do
      conn = delete(conn, ~p"/people/#{participant}")
      assert redirected_to(conn) == ~p"/people"

      assert_error_sent 404, fn ->
        get(conn, ~p"/people/#{participant}")
      end
    end
  end

  defp create_participant(_) do
    participant = participant_fixture()
    %{participant: participant}
  end
end
