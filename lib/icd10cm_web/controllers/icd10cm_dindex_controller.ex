defmodule Icd10cmWeb.Icd10cm_dindexController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10cm_dindex
  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10cm_dindex" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_icd10cm_dindexes(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)
      render(conn, "index.html", icd10cm_dindexes: page.entries, page: page)
    #icd10cm_dindexes = Codes.list_icd10cm_dindexes()
    #render(conn, "index.html", icd10cm_dindexes: icd10cm_dindexes)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10cm_dindex(%Icd10cm_dindex{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10cm_dindex" => icd10cm_dindex_params}) do
    case Codes.create_icd10cm_dindex(icd10cm_dindex_params) do
      {:ok, icd10cm_dindex} ->
        conn
        |> put_flash(:info, "Icd10cm dindex created successfully.")
        |> redirect(to: Routes.icd10cm_dindex_path(conn, :show, icd10cm_dindex))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10cm_dindex = Codes.get_icd10cm_dindex!(id)
    render(conn, "show.html", icd10cm_dindex: icd10cm_dindex)
  end

  def edit(conn, %{"id" => id}) do
    icd10cm_dindex = Codes.get_icd10cm_dindex!(id)
    changeset = Codes.change_icd10cm_dindex(icd10cm_dindex)
    render(conn, "edit.html", icd10cm_dindex: icd10cm_dindex, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10cm_dindex" => icd10cm_dindex_params}) do
    icd10cm_dindex = Codes.get_icd10cm_dindex!(id)

    case Codes.update_icd10cm_dindex(icd10cm_dindex, icd10cm_dindex_params) do
      {:ok, icd10cm_dindex} ->
        conn
        |> put_flash(:info, "Icd10cm dindex updated successfully.")
        |> redirect(to: Routes.icd10cm_dindex_path(conn, :show, icd10cm_dindex))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10cm_dindex: icd10cm_dindex, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10cm_dindex = Codes.get_icd10cm_dindex!(id)
    {:ok, _icd10cm_dindex} = Codes.delete_icd10cm_dindex(icd10cm_dindex)

    conn
    |> put_flash(:info, "Icd10cm dindex deleted successfully.")
    |> redirect(to: Routes.icd10cm_dindex_path(conn, :index))
  end

  ######################
  def search_dindexes(
    conn,
    %{"search_dindexes" => %{"query" => query, "selection" => selection}} = params
  )
  do
trim_query = String.trim(query)

page =
  Icd10cm.Codes.search_dindexes(trim_query, selection)
  |> Icd10cm.Repo.paginate(page: params["page"], page_size: 400)

render(conn, "index.html", icd10cm_dindexes: page.entries, page: page)
end

######

  ######################
end
