defmodule Icd10cm.Codes do
  @moduledoc """
  The Codes context.
  """

  import Ecto.Query, warn: false
  alias Icd10cm.Repo

  alias Icd10cm.Codes.Icd10clinical

  @doc """
  Returns the list of icd10clinicals.

  ## Examples

      iex> list_icd10clinicals()
      [%Icd10clinical{}, ...]

  """



  @doc """
  Gets a single icd10clinical.

  Raises `Ecto.NoResultsError` if the Icd10clinical does not exist.

  ## Examples

      iex> get_icd10clinical!(123)
      %Icd10clinical{}

      iex> get_icd10clinical!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10clinical!(id), do: Repo.get!(Icd10clinical, id)

  @doc """
  Creates a icd10clinical.

  ## Examples

      iex> create_icd10clinical(%{field: value})
      {:ok, %Icd10clinical{}}

      iex> create_icd10clinical(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10clinical(attrs \\ %{}) do
    %Icd10clinical{}
    |> Icd10clinical.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10clinical.

  ## Examples

      iex> update_icd10clinical(icd10clinical, %{field: new_value})
      {:ok, %Icd10clinical{}}

      iex> update_icd10clinical(icd10clinical, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10clinical(%Icd10clinical{} = icd10clinical, attrs) do
    icd10clinical
    |> Icd10clinical.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10clinical.

  ## Examples

      iex> delete_icd10clinical(icd10clinical)
      {:ok, %Icd10clinical{}}

      iex> delete_icd10clinical(icd10clinical)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10clinical(%Icd10clinical{} = icd10clinical) do
    Repo.delete(icd10clinical)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10clinical changes.

  ## Examples

      iex> change_icd10clinical(icd10clinical)
      %Ecto.Changeset{data: %Icd10clinical{}}

  """
  def change_icd10clinical(%Icd10clinical{} = icd10clinical, attrs \\ %{}) do
    Icd10clinical.changeset(icd10clinical, attrs)
  end


  def list_icd10clinicals(_params) do
    _page =
     Icd10clinical
     |> order_by([p], [p.icd10cm_code_2])
  end


end
