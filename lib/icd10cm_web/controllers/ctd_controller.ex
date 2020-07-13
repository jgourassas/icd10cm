defmodule Icd10cmWeb.CtdController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Ctd
  import Ecto.Query, warn: false

  plug(:scrub_params, "ctd" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_ctds(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)

    render(conn, "index.html", ctds: page.entries, page: page)

    # ctds = Codes.list_ctds()
    # render(conn, "index.html", ctds: ctds)
  end

  def new(conn, _params) do
    changeset = Codes.change_ctd(%Ctd{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ctd" => ctd_params}) do
    case Codes.create_ctd(ctd_params) do
      {:ok, ctd} ->
        conn
        |> put_flash(:info, "Ctd created successfully.")
        |> redirect(to: Routes.ctd_path(conn, :show, ctd))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ctd = Codes.get_ctd!(id)
    render(conn, "show.html", ctd: ctd)
  end

  def edit(conn, %{"id" => id}) do
    ctd = Codes.get_ctd!(id)
    changeset = Codes.change_ctd(ctd)
    render(conn, "edit.html", ctd: ctd, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ctd" => ctd_params}) do
    ctd = Codes.get_ctd!(id)

    case Codes.update_ctd(ctd, ctd_params) do
      {:ok, ctd} ->
        conn
        |> put_flash(:info, "Ctd updated successfully.")
        |> redirect(to: Routes.ctd_path(conn, :show, ctd))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ctd: ctd, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ctd = Codes.get_ctd!(id)
    {:ok, _ctd} = Codes.delete_ctd(ctd)

    conn
    |> put_flash(:info, "Ctd deleted successfully.")
    |> redirect(to: Routes.ctd_path(conn, :index))
  end

  ###############
  def search_ctds(
        conn,
        %{"search_ctds" => %{"query" => query, "selection" => selection}} = params
      ) do
    trim_query = String.trim(query)

    page =
      Icd10cm.Codes.search_ctds(trim_query, selection)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 400)

    render(conn, "index.html", ctds: page.entries, page: page)
  end

  ############### 33
end
