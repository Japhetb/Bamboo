defmodule Bamboo.Analystsnews do
  @moduledoc """
  The Analystsnews context.
  """

  import Ecto.Query, warn: false
  alias Bamboo.Repo

  alias Bamboo.Analystsnews.Analystsnew

  @doc """
  Returns the list of analystsnews.

  ## Examples

      iex> list_analystsnews()
      [%Analystsnew{}, ...]

  """
  def list_analystsnews do
    Repo.all(Analystsnew)
  end

  @doc """
  Gets a single analystsnew.

  Raises `Ecto.NoResultsError` if the Analystsnew does not exist.

  ## Examples

      iex> get_analystsnew!(123)
      %Analystsnew{}

      iex> get_analystsnew!(456)
      ** (Ecto.NoResultsError)

  """
  def get_analystsnew!(id), do: Repo.get!(Analystsnew, id)

  @doc """
  Creates a analystsnew.

  ## Examples

      iex> create_analystsnew(%{field: value})
      {:ok, %Analystsnew{}}

      iex> create_analystsnew(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_analystsnew(attrs \\ %{}) do
    %Analystsnew{}
    |> Analystsnew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a analystsnew.

  ## Examples

      iex> update_analystsnew(analystsnew, %{field: new_value})
      {:ok, %Analystsnew{}}

      iex> update_analystsnew(analystsnew, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_analystsnew(%Analystsnew{} = analystsnew, attrs) do
    analystsnew
    |> Analystsnew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a analystsnew.

  ## Examples

      iex> delete_analystsnew(analystsnew)
      {:ok, %Analystsnew{}}

      iex> delete_analystsnew(analystsnew)
      {:error, %Ecto.Changeset{}}

  """
  def delete_analystsnew(%Analystsnew{} = analystsnew) do
    Repo.delete(analystsnew)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking analystsnew changes.

  ## Examples

      iex> change_analystsnew(analystsnew)
      %Ecto.Changeset{data: %Analystsnew{}}

  """
  def change_analystsnew(%Analystsnew{} = analystsnew, attrs \\ %{}) do
    Analystsnew.changeset(analystsnew, attrs)
  end
end
