defmodule Icd10cmWeb.Icd10cm_orderController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Icd10cm_order
  import Ecto.Query, warn: false

  plug(:scrub_params, "icd10cm_order" when action in [:create, :update])

  def index(conn, params) do
    page =
    Codes.list_icd10cm_orders(params)
    |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)
    render(conn, "index.html", icd10cm_orders: page.entries, page: page)
    #icd10cm_orders = Codes.list_icd10cm_orders()
    #render(conn, "index.html", icd10cm_orders: icd10cm_orders)
  end

  def new(conn, _params) do
    changeset = Codes.change_icd10cm_order(%Icd10cm_order{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"icd10cm_order" => icd10cm_order_params}) do
    case Codes.create_icd10cm_order(icd10cm_order_params) do
      {:ok, icd10cm_order} ->
        conn
        |> put_flash(:info, "Icd10cm order created successfully.")
        |> redirect(to: Routes.icd10cm_order_path(conn, :show, icd10cm_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    icd10cm_order = Codes.get_icd10cm_order!(id)
    render(conn, "show.html", icd10cm_order: icd10cm_order)
  end

  def edit(conn, %{"id" => id}) do
    icd10cm_order = Codes.get_icd10cm_order!(id)
    changeset = Codes.change_icd10cm_order(icd10cm_order)
    render(conn, "edit.html", icd10cm_order: icd10cm_order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "icd10cm_order" => icd10cm_order_params}) do
    icd10cm_order = Codes.get_icd10cm_order!(id)

    case Codes.update_icd10cm_order(icd10cm_order, icd10cm_order_params) do
      {:ok, icd10cm_order} ->
        conn
        |> put_flash(:info, "Icd10cm order updated successfully.")
        |> redirect(to: Routes.icd10cm_order_path(conn, :show, icd10cm_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", icd10cm_order: icd10cm_order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    icd10cm_order = Codes.get_icd10cm_order!(id)
    {:ok, _icd10cm_order} = Codes.delete_icd10cm_order(icd10cm_order)

    conn
    |> put_flash(:info, "Icd10cm order deleted successfully.")
    |> redirect(to: Routes.icd10cm_order_path(conn, :index))
  end
###########################

#############################
def search_orders(

    conn,
    %{"search_orders" => %{"query" => query, "selection" => selection}} = params
  ) do

    trim_query = String.trim(query)


    page =
      Icd10cm.Codes.search_orders(trim_query, selection)
       |> Icd10cm.Repo.paginate(page: params["page"], page_size: 400)

      render(conn, "index.html", icd10cm_orders: page.entries, page: page)

  end


  ####################################
end
