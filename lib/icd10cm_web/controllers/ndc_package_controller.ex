defmodule Icd10cmWeb.Ndc_packageController do
  use Icd10cmWeb, :controller

  alias Icd10cm.Codes
  alias Icd10cm.Codes.Ndc_package
  alias Icd10cm.Codes.Ndc_product

  alias Icd10cm.Repo

  plug(:assign_ndc_products)

  def index(conn, _params) do
    ndc_packages = Codes.list_ndc_packages(conn)
    render(conn, "index.html", ndc_packages: ndc_packages)
  end

  def new(conn, _params) do
    changeset = Codes.change_ndc_package(%Ndc_package{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ndc_package" => ndc_package_params}) do
    case Codes.create_ndc_package(ndc_package_params) do
      {:ok, ndc_package} ->
        conn
        |> put_flash(:info, "Ndc package created successfully.")
        |> redirect(to: Routes.ndc_package_path(conn, :show, ndc_package))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ndc_package = Codes.get_ndc_package!(id)
    render(conn, "show.html", ndc_package: ndc_package)
  end

  def edit(conn, %{"id" => id}) do
    ndc_package = Codes.get_ndc_package!(id)
    changeset = Codes.change_ndc_package(ndc_package)
    render(conn, "edit.html", ndc_package: ndc_package, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ndc_package" => ndc_package_params}) do
    ndc_package = Codes.get_ndc_package!(id)

    case Codes.update_ndc_package(ndc_package, ndc_package_params) do
      {:ok, ndc_package} ->
        conn
        |> put_flash(:info, "Ndc package updated successfully.")
        |> redirect(to: Routes.ndc_package_path(conn, :show, ndc_package))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ndc_package: ndc_package, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ndc_package = Codes.get_ndc_package!(id)
    {:ok, _ndc_package} = Codes.delete_ndc_package(ndc_package)

    conn
    |> put_flash(:info, "Ndc package deleted successfully.")
    |> redirect(to: Routes.ndc_package_path(conn, :index))
  end
###############################333
def assign_ndc_products(conn, _opts) do
  case conn.params do
    %{"ndc_product_id" => ndc_product_id} ->
      case Repo.get(Ndc_product, ndc_product_id) do

        ndc_product ->
        #IO.puts("---------------------------------------------------------" )
        #IO.inspect ndc_product
          assign(conn, :ndc_product, ndc_product)
      end 

    _ ->
      conn
      |> send_resp(404, "NDC PRODUCT  Not Found")
      |> halt()
  end
end

######################################

end
