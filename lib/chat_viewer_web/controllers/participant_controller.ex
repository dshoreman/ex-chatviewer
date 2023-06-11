defmodule ChatViewerWeb.ParticipantController do
  use ChatViewerWeb, :controller

  alias ChatViewer.Chats
  alias ChatViewer.Chats.Participant

  def index(conn, _params) do
    people = Chats.list_people()
    render(conn, :index, people: people)
  end

  def new(conn, _params) do
    changeset = Chats.change_participant(%Participant{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"participant" => participant_params}) do
    case Chats.create_participant(participant_params) do
      {:ok, participant} ->
        conn
        |> put_flash(:info, "Participant created successfully.")
        |> redirect(to: ~p"/people/#{participant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    participant = Chats.get_participant!(id)
    render(conn, :show, participant: participant)
  end

  def edit(conn, %{"id" => id}) do
    participant = Chats.get_participant!(id)
    changeset = Chats.change_participant(participant)
    render(conn, :edit, participant: participant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "participant" => participant_params}) do
    participant = Chats.get_participant!(id)

    case Chats.update_participant(participant, participant_params) do
      {:ok, participant} ->
        conn
        |> put_flash(:info, "Participant updated successfully.")
        |> redirect(to: ~p"/people/#{participant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, participant: participant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    participant = Chats.get_participant!(id)
    {:ok, _participant} = Chats.delete_participant(participant)

    conn
    |> put_flash(:info, "Participant deleted successfully.")
    |> redirect(to: ~p"/people")
  end
end
