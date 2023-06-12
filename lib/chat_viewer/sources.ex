defmodule ChatViewer.Sources do
  @moduledoc """
  The Sources context.
  """

  import Ecto.Query, warn: false
  alias ChatViewer.Repo

  alias ChatViewer.Sources.FacebookDump

  @doc """
  Returns the list of facebook_dumps.

  ## Examples

      iex> list_facebook_dumps()
      [%FacebookDump{}, ...]

  """
  def list_facebook_dumps do
    Repo.all(FacebookDump)
  end

  @doc """
  Gets a single facebook_dump.

  Raises `Ecto.NoResultsError` if the Facebook dump does not exist.

  ## Examples

      iex> get_facebook_dump!(123)
      %FacebookDump{}

      iex> get_facebook_dump!(456)
      ** (Ecto.NoResultsError)

  """
  def get_facebook_dump!(id), do: Repo.get!(FacebookDump, id)

  @doc """
  Creates a facebook_dump.

  ## Examples

      iex> create_facebook_dump(%{field: value})
      {:ok, %FacebookDump{}}

      iex> create_facebook_dump(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_facebook_dump(attrs \\ %{}) do
    %FacebookDump{}
    |> FacebookDump.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a facebook_dump.

  ## Examples

      iex> update_facebook_dump(facebook_dump, %{field: new_value})
      {:ok, %FacebookDump{}}

      iex> update_facebook_dump(facebook_dump, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_facebook_dump(%FacebookDump{} = facebook_dump, attrs) do
    facebook_dump
    |> FacebookDump.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a facebook_dump.

  ## Examples

      iex> delete_facebook_dump(facebook_dump)
      {:ok, %FacebookDump{}}

      iex> delete_facebook_dump(facebook_dump)
      {:error, %Ecto.Changeset{}}

  """
  def delete_facebook_dump(%FacebookDump{} = facebook_dump) do
    Repo.delete(facebook_dump)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking facebook_dump changes.

  ## Examples

      iex> change_facebook_dump(facebook_dump)
      %Ecto.Changeset{data: %FacebookDump{}}

  """
  def change_facebook_dump(%FacebookDump{} = facebook_dump, attrs \\ %{}) do
    FacebookDump.changeset(facebook_dump, attrs)
  end
end
