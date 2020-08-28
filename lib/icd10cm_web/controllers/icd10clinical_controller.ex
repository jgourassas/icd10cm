defmodule Icd10cmWeb.Icd10clinicalController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10clinical
  #alias Icd10cm.Repo

  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10clinical" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_icd10clinicals(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)

    render(conn, "index.html", icd10clinicals: page.entries, page: page)

    # icd10clinicals = Codes.list_icd10clinicals(params)
    # render(conn, "index.html", icd10clinicals: icd10clinicals)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10clinical(%Icd10clinical{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10clinical" => icd10clinical_params}) do
    case Codes.create_icd10clinical(icd10clinical_params) do
      {:ok, icd10clinical} ->
        conn
        |> put_flash(:info, "Icd10clinical created successfully.")
        |> redirect(to: Routes.icd10clinical_path(conn, :show, icd10clinical))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10clinical = Codes.get_icd10clinical!(id)
    render(conn, "show.html", icd10clinical: icd10clinical)
  end

  def edit(conn, %{"id" => id}) do
    icd10clinical = Codes.get_icd10clinical!(id)
    changeset = Codes.change_icd10clinical(icd10clinical)
    render(conn, "edit.html", icd10clinical: icd10clinical, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10clinical" => icd10clinical_params}) do
    icd10clinical = Codes.get_icd10clinical!(id)

    case Codes.update_icd10clinical(icd10clinical, icd10clinical_params) do
      {:ok, icd10clinical} ->
        conn
        |> put_flash(:info, "Icd10clinical updated successfully.")
        |> redirect(to: Routes.icd10clinical_path(conn, :show, icd10clinical))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10clinical: icd10clinical, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10clinical = Codes.get_icd10clinical!(id)
    {:ok, _icd10clinical} = Codes.delete_icd10clinical(icd10clinical)

    conn
    |> put_flash(:info, "Icd10clinical deleted successfully.")
    |> redirect(to: Routes.icd10clinical_path(conn, :index))
  end

  ###########################
  def search_clinicals_2(
        conn,
        %{"search_clinicals" => %{"query" => query, "selection" => selection}} = params
      ) do
    trim_query = String.trim(query)

    page =
      Icd10cm.Codes.search_clinicals(trim_query, selection)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 800)

    render(conn, "index.html", icd10clinicals: page.entries, page: page)
  end

  ####################################
  # def search_index(icd10clinicals, page) do
  #  render(conn, "search_index.html", icd10clinicals: page.entries, page: page)
  # end

  ############################# 3
  def search_clinicals(
        conn,
        %{"search_clinicals" => %{"query" => query, "selection" => selection}} = params
      ) do
    trim_query = String.trim(query)

    page =
      Icd10cm.Codes.search_clinicals(trim_query, selection)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 800)

    render(conn, "index.html", icd10clinicals: page.entries, page: page)
  end

  #############################
end
