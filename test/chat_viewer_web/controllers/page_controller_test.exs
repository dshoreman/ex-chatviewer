defmodule ChatViewerWeb.PageControllerTest do
  use ChatViewerWeb.ConnCase

  import ChatViewer.AccountsFixtures

  test "GET /", %{conn: conn} do
    conn = get(log_in_user(conn, user_fixture()), ~p"/")
    assert html_response(conn, 200) =~ ""
  end
end
