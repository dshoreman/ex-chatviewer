defmodule ChatViewerWeb.PageController do
  use ChatViewerWeb, :controller

  alias ChatViewer.Sources

  def home(conn, _params) do
    render(conn, :home)
  end

  def sources(conn, _params) do
    facebook_dumps = Sources.list_facebook_dumps()
    render(conn, :sources, facebook_dumps: facebook_dumps)
  end
end
