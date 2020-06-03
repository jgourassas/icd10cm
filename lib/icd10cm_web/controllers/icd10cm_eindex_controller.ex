defmodule Icd10cmWeb.Icd10cm_eindexController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10cm_eindex
  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10cm_eindex" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_icd10cm_eindexes(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)

    render(conn, "index.html", icd10cm_eindexes: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10cm_eindex(%Icd10cm_eindex{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10cm_eindex" => icd10cm_eindex_params}) do
    case Codes.create_icd10cm_eindex(icd10cm_eindex_params) do
      {:ok, icd10cm_eindex} ->
        conn
        |> put_flash(:info, "Icd10cm eindex created successfully.")
        |> redirect(to: Routes.icd10cm_eindex_path(conn, :show, icd10cm_eindex))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10cm_eindex = Codes.get_icd10cm_eindex!(id)
    render(conn, "show.html", icd10cm_eindex: icd10cm_eindex)
  end

  def edit(conn, %{"id" => id}) do
    icd10cm_eindex = Codes.get_icd10cm_eindex!(id)
    changeset = Codes.change_icd10cm_eindex(icd10cm_eindex)
    render(conn, "edit.html", icd10cm_eindex: icd10cm_eindex, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10cm_eindex" => icd10cm_eindex_params}) do
    icd10cm_eindex = Codes.get_icd10cm_eindex!(id)

    case Codes.update_icd10cm_eindex(icd10cm_eindex, icd10cm_eindex_params) do
      {:ok, icd10cm_eindex} ->
        conn
        |> put_flash(:info, "Icd10cm eindex updated successfully.")
        |> redirect(to: Routes.icd10cm_eindex_path(conn, :show, icd10cm_eindex))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10cm_eindex: icd10cm_eindex, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10cm_eindex = Codes.get_icd10cm_eindex!(id)
    {:ok, _icd10cm_eindex} = Codes.delete_icd10cm_eindex(icd10cm_eindex)

    conn
    |> put_flash(:info, "Icd10cm eindex deleted successfully.")
    |> redirect(to: Routes.icd10cm_eindex_path(conn, :index))
  end
###############################
def search_eindexes(

    conn,
    %{"search_eindexes" => %{"query" => query, "selection" => selection}} = params
  ) do

    trim_query = String.trim(query)


    page =
      Icd10cm.Codes.search_eindexes(trim_query, selection)
       |> Icd10cm.Repo.paginate(page: params["page"], page_size: 400)

      render(conn, "index.html", icd10cm_eindexes: page.entries, page: page)

  end







  ################################3
end
