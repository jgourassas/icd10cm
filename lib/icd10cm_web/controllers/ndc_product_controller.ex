defmodule Icd10cmWeb.Ndc_productController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Ndc_product

  def index(conn, params) do
    page =
    Codes.list_ndc_products(params)
    |> Icd10cm.Repo.paginate(page: params["page"], page_size: 30)
    render(conn, "index.html", ndc_products: page.entries, page: page)
    #ndc_products = Codes.list_ndc_products()
    #render(conn, "index.html", ndc_products: ndc_products)
  end

  def new(conn, _params) do
    changeset = Codes.change_ndc_product(%Ndc_product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ndc_product" => ndc_product_params}) do
    case Codes.create_ndc_product(ndc_product_params) do
      {:ok, ndc_product} ->
        conn
        |> put_flash(:info, "Ndc product created successfully.")
        |> redirect(to: Routes.ndc_product_path(conn, :show, ndc_product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ndc_product = Codes.get_ndc_product!(id)
    render(conn, "show.html", ndc_product: ndc_product)
  end

  def edit(conn, %{"id" => id}) do
    ndc_product = Codes.get_ndc_product!(id)
    changeset = Codes.change_ndc_product(ndc_product)
    render(conn, "edit.html", ndc_product: ndc_product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ndc_product" => ndc_product_params}) do
    ndc_product = Codes.get_ndc_product!(id)

    case Codes.update_ndc_product(ndc_product, ndc_product_params) do
      {:ok, ndc_product} ->
        conn
        |> put_flash(:info, "Ndc product updated successfully.")
        |> redirect(to: Routes.ndc_product_path(conn, :show, ndc_product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ndc_product: ndc_product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ndc_product = Codes.get_ndc_product!(id)
    {:ok, _ndc_product} = Codes.delete_ndc_product(ndc_product)

    conn
    |> put_flash(:info, "Ndc product deleted successfully.")
    |> redirect(to: Routes.ndc_product_path(conn, :index))
  end

#####################
def search_ndc(
  conn,
  %{"search_ndc" => %{"query" => query, "selection" => selection}} = params
) do
trim_query = String.trim(query)

page =
Icd10cm.Codes.search_ndc(trim_query, selection)
|> Icd10cm.Repo.paginate(page: params["page"], page_size: 800)

render(conn, "index.html", ndc_products: page.entries, page: page)
end
#########################
end
