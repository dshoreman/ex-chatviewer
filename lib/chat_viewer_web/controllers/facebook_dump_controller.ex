defmodule ChatViewerWeb.FacebookDumpController do
  use ChatViewerWeb, :controller

  alias ChatViewer.Sources
  alias ChatViewer.Sources.FacebookDump

  def index(conn, _params) do
    facebook_dumps = Sources.list_facebook_dumps()
    render(conn, :index, facebook_dumps: facebook_dumps)
  end

  def new(conn, _params) do
    changeset = Sources.change_facebook_dump(%FacebookDump{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"facebook_dump" => facebook_dump_params}) do
    case Sources.create_facebook_dump(facebook_dump_params) do
      {:ok, facebook_dump} ->
        conn
        |> put_flash(:info, "Facebook dump created successfully.")
        |> redirect(to: ~p"/sources/facebook/#{facebook_dump}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    facebook_dump = Sources.get_facebook_dump!(id)
    render(conn, :show, facebook_dump: facebook_dump)
  end

  def edit(conn, %{"id" => id}) do
    facebook_dump = Sources.get_facebook_dump!(id)
    changeset = Sources.change_facebook_dump(facebook_dump)
    render(conn, :edit, facebook_dump: facebook_dump, changeset: changeset)
  end

  def update(conn, %{"id" => id, "facebook_dump" => facebook_dump_params}) do
    facebook_dump = Sources.get_facebook_dump!(id)

    case Sources.update_facebook_dump(facebook_dump, facebook_dump_params) do
      {:ok, facebook_dump} ->
        conn
        |> put_flash(:info, "Facebook dump updated successfully.")
        |> redirect(to: ~p"/sources/facebook/#{facebook_dump}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, facebook_dump: facebook_dump, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    facebook_dump = Sources.get_facebook_dump!(id)
    {:ok, _facebook_dump} = Sources.delete_facebook_dump(facebook_dump)

    conn
    |> put_flash(:info, "Facebook dump deleted successfully.")
    |> redirect(to: ~p"/sources/facebook")
  end
end
