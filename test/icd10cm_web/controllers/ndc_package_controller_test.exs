defmodule Icd10cmWeb.Ndc_packageControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{endmarketingdate: "some endmarketingdate", ndc_exclude_flag: "some ndc_exclude_flag", ndcpackagecode: "some ndcpackagecode", packagedescription: "some packagedescription", productid: "some productid", productndc: "some productndc", sample_package: "some sample_package", startmarketingdate: "some startmarketingdate"}
  @update_attrs %{endmarketingdate: "some updated endmarketingdate", ndc_exclude_flag: "some updated ndc_exclude_flag", ndcpackagecode: "some updated ndcpackagecode", packagedescription: "some updated packagedescription", productid: "some updated productid", productndc: "some updated productndc", sample_package: "some updated sample_package", startmarketingdate: "some updated startmarketingdate"}
  @invalid_attrs %{endmarketingdate: nil, ndc_exclude_flag: nil, ndcpackagecode: nil, packagedescription: nil, productid: nil, productndc: nil, sample_package: nil, startmarketingdate: nil}

  def fixture(:ndc_package) do
    {:ok, ndc_package} = Codes.create_ndc_package(@create_attrs)
    ndc_package
  end

  describe "index" do
    test "lists all ndc_packages", %{conn: conn} do
      conn = get(conn, Routes.ndc_package_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ndc packages"
    end
  end

  describe "new ndc_package" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ndc_package_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ndc package"
    end
  end

  describe "create ndc_package" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ndc_package_path(conn, :create), ndc_package: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ndc_package_path(conn, :show, id)

      conn = get(conn, Routes.ndc_package_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ndc package"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ndc_package_path(conn, :create), ndc_package: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ndc package"
    end
  end

  describe "edit ndc_package" do
    setup [:create_ndc_package]

    test "renders form for editing chosen ndc_package", %{conn: conn, ndc_package: ndc_package} do
      conn = get(conn, Routes.ndc_package_path(conn, :edit, ndc_package))
      assert html_response(conn, 200) =~ "Edit Ndc package"
    end
  end

  describe "update ndc_package" do
    setup [:create_ndc_package]

    test "redirects when data is valid", %{conn: conn, ndc_package: ndc_package} do
      conn = put(conn, Routes.ndc_package_path(conn, :update, ndc_package), ndc_package: @update_attrs)
      assert redirected_to(conn) == Routes.ndc_package_path(conn, :show, ndc_package)

      conn = get(conn, Routes.ndc_package_path(conn, :show, ndc_package))
      assert html_response(conn, 200) =~ "some updated endmarketingdate"
    end

    test "renders errors when data is invalid", %{conn: conn, ndc_package: ndc_package} do
      conn = put(conn, Routes.ndc_package_path(conn, :update, ndc_package), ndc_package: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ndc package"
    end
  end

  describe "delete ndc_package" do
    setup [:create_ndc_package]

    test "deletes chosen ndc_package", %{conn: conn, ndc_package: ndc_package} do
      conn = delete(conn, Routes.ndc_package_path(conn, :delete, ndc_package))
      assert redirected_to(conn) == Routes.ndc_package_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.ndc_package_path(conn, :show, ndc_package))
      end
    end
  end

  defp create_ndc_package(_) do
    ndc_package = fixture(:ndc_package)
    %{ndc_package: ndc_package}
  end
end
