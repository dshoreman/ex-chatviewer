defmodule ChatViewerWeb.FacebookDumpControllerTest do
  use ChatViewerWeb.ConnCase

  import ChatViewer.AccountsFixtures
  import ChatViewer.SourcesFixtures

  @create_attrs %{name: "some name", path: "some path"}
  @update_attrs %{name: "some updated name", path: "some updated path"}
  @invalid_attrs %{name: nil, path: nil}

  describe "index" do
    test "lists all facebook_dumps", %{conn: conn} do
      conn = get(log_in_user(conn, user_fixture()), ~p"/sources/facebook")
      assert html_response(conn, 200) =~ "Listing Facebook dumps"
    end
  end

  describe "new facebook_dump" do
    test "renders form", %{conn: conn} do
      conn = get(log_in_user(conn, user_fixture()), ~p"/sources/facebook/new")
      assert html_response(conn, 200) =~ "New Facebook dump"
    end
  end

  describe "create facebook_dump" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = conn
        |> log_in_user(user_fixture())
        |> post(~p"/sources/facebook", facebook_dump: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/sources/facebook/#{id}"

      conn = get(conn, ~p"/sources/facebook/#{id}")
      assert html_response(conn, 200) =~ "Facebook dump #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = conn
        |> log_in_user(user_fixture())
        |> post(~p"/sources/facebook", facebook_dump: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Facebook dump"
    end
  end

  describe "edit facebook_dump" do
    setup [:create_facebook_dump]

    test "renders form for editing chosen facebook_dump", %{conn: conn, facebook_dump: facebook_dump} do
      conn = get(log_in_user(conn, user_fixture()), ~p"/sources/facebook/#{facebook_dump}/edit")
      assert html_response(conn, 200) =~ "Edit Facebook dump"
    end
  end

  describe "update facebook_dump" do
    setup [:create_facebook_dump]

    test "redirects when data is valid", %{conn: conn, facebook_dump: facebook_dump} do
      conn = conn
        |> log_in_user(user_fixture())
        |> put(~p"/sources/facebook/#{facebook_dump}", facebook_dump: @update_attrs)
      assert redirected_to(conn) == ~p"/sources/facebook/#{facebook_dump}"

      conn = get(conn, ~p"/sources/facebook/#{facebook_dump}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, facebook_dump: facebook_dump} do
      conn = conn
        |> log_in_user(user_fixture())
        |> put(~p"/sources/facebook/#{facebook_dump}", facebook_dump: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Facebook dump"
    end
  end

  describe "delete facebook_dump" do
    setup [:create_facebook_dump]

    test "deletes chosen facebook_dump", %{conn: conn, facebook_dump: facebook_dump} do
      conn = delete(log_in_user(conn, user_fixture()), ~p"/sources/facebook/#{facebook_dump}")
      assert redirected_to(conn) == ~p"/sources/facebook"

      assert_error_sent 404, fn ->
        get(conn, ~p"/sources/facebook/#{facebook_dump}")
      end
    end
  end

  defp create_facebook_dump(_) do
    facebook_dump = facebook_dump_fixture()
    %{facebook_dump: facebook_dump}
  end
end
