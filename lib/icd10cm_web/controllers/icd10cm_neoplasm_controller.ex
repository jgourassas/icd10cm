defmodule Icd10cmWeb.Icd10cm_neoplasmController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10cm_neoplasm
  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10cm_neoplasm" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_icd10cm_neoplasms(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)

    render(conn, "index.html", icd10cm_neoplasms: page.entries, page: page)

    # icd10cm_neoplasms = Codes.list_icd10cm_neoplasms()
    # render(conn, "index.html", icd10cm_neoplasms: icd10cm_neoplasms)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10cm_neoplasm(%Icd10cm_neoplasm{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10cm_neoplasm" => icd10cm_neoplasm_params}) do
    case Codes.create_icd10cm_neoplasm(icd10cm_neoplasm_params) do
      {:ok, icd10cm_neoplasm} ->
        conn
        |> put_flash(:info, "Icd10cm neoplasm created successfully.")
        |> redirect(to: Routes.icd10cm_neoplasm_path(conn, :show, icd10cm_neoplasm))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10cm_neoplasm = Codes.get_icd10cm_neoplasm!(id)
    render(conn, "show.html", icd10cm_neoplasm: icd10cm_neoplasm)
  end

  def edit(conn, %{"id" => id}) do
    icd10cm_neoplasm = Codes.get_icd10cm_neoplasm!(id)
    changeset = Codes.change_icd10cm_neoplasm(icd10cm_neoplasm)
    render(conn, "edit.html", icd10cm_neoplasm: icd10cm_neoplasm, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10cm_neoplasm" => icd10cm_neoplasm_params}) do
    icd10cm_neoplasm = Codes.get_icd10cm_neoplasm!(id)

    case Codes.update_icd10cm_neoplasm(icd10cm_neoplasm, icd10cm_neoplasm_params) do
      {:ok, icd10cm_neoplasm} ->
        conn
        |> put_flash(:info, "Icd10cm neoplasm updated successfully.")
        |> redirect(to: Routes.icd10cm_neoplasm_path(conn, :show, icd10cm_neoplasm))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10cm_neoplasm: icd10cm_neoplasm, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10cm_neoplasm = Codes.get_icd10cm_neoplasm!(id)
    {:ok, _icd10cm_neoplasm} = Codes.delete_icd10cm_neoplasm(icd10cm_neoplasm)

    conn
    |> put_flash(:info, "Icd10cm neoplasm deleted successfully.")
    |> redirect(to: Routes.icd10cm_neoplasm_path(conn, :index))
  end

  #################
  def search_neoplasms(
        conn,
        %{"search_neoplasms" => %{"query" => query, "selection" => selection}} = params
      )
      do
    trim_query = String.trim(query)

    page =
      Icd10cm.Codes.search_neoplasms(trim_query, selection)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 400)

    render(conn, "index.html", icd10cm_neoplasms: page.entries, page: page)
  end

  ################################
end
