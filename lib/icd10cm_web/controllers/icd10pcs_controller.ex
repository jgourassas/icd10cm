defmodule Icd10cmWeb.Icd10pcsController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10pcs
  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10_pcs" when action in [:create, :update])

  def index(conn, params) do
    page =
      Codes.list_icd10_pcses(params)
      |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)

    render(conn, "index.html", icd10_pcses: page.entries, page: page)

    #icd10_pcses = Codes.list_icd10_pcses()
   # render(conn, "index.html", icd10_pcses: icd10_pcses)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10pcs(%Icd10pcs{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10pcs" => icd10pcs_params}) do
    case Codes.create_icd10pcs(icd10pcs_params) do
      {:ok, icd10pcs} ->
        conn
        |> put_flash(:info, "Icd10pcs created successfully.")
        |> redirect(to: Routes.icd10pcs_path(conn, :show, icd10pcs))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10pcs = Codes.get_icd10pcs!(id)
    render(conn, "show.html", icd10pcs: icd10pcs)
  end

  def edit(conn, %{"id" => id}) do
    icd10pcs = Codes.get_icd10pcs!(id)
    changeset = Codes.change_icd10pcs(icd10pcs)
    render(conn, "edit.html", icd10pcs: icd10pcs, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10pcs" => icd10pcs_params}) do
    icd10pcs = Codes.get_icd10pcs!(id)

    case Codes.update_icd10pcs(icd10pcs, icd10pcs_params) do
      {:ok, icd10pcs} ->
        conn
        |> put_flash(:info, "Icd10pcs updated successfully.")
        |> redirect(to: Routes.icd10pcs_path(conn, :show, icd10pcs))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10pcs: icd10pcs, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10pcs = Codes.get_icd10pcs!(id)
    {:ok, _icd10pcs} = Codes.delete_icd10pcs(icd10pcs)

    conn
    |> put_flash(:info, "Icd10pcs deleted successfully.")
    |> redirect(to: Routes.icd10pcs_path(conn, :index))
  end

  def search_pcs(
    conn,
    %{"search_pcs" => %{"query" => query, "selection" => selection}} = params
  )
  do
trim_query = String.trim(query)

page =
  Icd10cm.Codes.search_pcs(trim_query, selection)
  |> Icd10cm.Repo.paginate(page: params["page"], page_size: 800)
   render(conn, "index.html", icd10_pcses: page.entries, page: page)
end




end
