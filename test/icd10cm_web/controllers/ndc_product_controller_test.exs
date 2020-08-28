defmodule Icd10cmWeb.Ndc_productControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{ACTIVE_INGRED_UNIT: "some ACTIVE_INGRED_UNIT", ACTIVE_NUMERATOR_STRENGTH: "some ACTIVE_NUMERATOR_STRENGTH", APPLICATIONNUMBER: "some APPLICATIONNUMBER", DEASCHEDULE: "some DEASCHEDULE", DOSAGEFORMNAME: "some DOSAGEFORMNAME", ENDMARKETINGDATE: "some ENDMARKETINGDATE", LABELERNAME: "some LABELERNAME", LISTING_RECORD_CERTIFIED_THROUGH: "some LISTING_RECORD_CERTIFIED_THROUGH", MARKETINGCATEGORYNAME: "some MARKETINGCATEGORYNAME", NDC_EXCLUDE_FLAG: "some NDC_EXCLUDE_FLAG", NONPROPRIETARYNAME: "some NONPROPRIETARYNAME", PHARM_CLASSES: "some PHARM_CLASSES", PRODUCTID: "some PRODUCTID", PRODUCTNDC: "some PRODUCTNDC", PRODUCTTYPENAME: "some PRODUCTTYPENAME", PROPRIETARYNAME: "some PROPRIETARYNAME", PROPRIETARYNAMESUFFIX: "some PROPRIETARYNAMESUFFIX", ROUTENAME: "some ROUTENAME", STARTMARKETINGDATE: "some STARTMARKETINGDATE", SUBSTANCENAME: "some SUBSTANCENAME"}
  @update_attrs %{ACTIVE_INGRED_UNIT: "some updated ACTIVE_INGRED_UNIT", ACTIVE_NUMERATOR_STRENGTH: "some updated ACTIVE_NUMERATOR_STRENGTH", APPLICATIONNUMBER: "some updated APPLICATIONNUMBER", DEASCHEDULE: "some updated DEASCHEDULE", DOSAGEFORMNAME: "some updated DOSAGEFORMNAME", ENDMARKETINGDATE: "some updated ENDMARKETINGDATE", LABELERNAME: "some updated LABELERNAME", LISTING_RECORD_CERTIFIED_THROUGH: "some updated LISTING_RECORD_CERTIFIED_THROUGH", MARKETINGCATEGORYNAME: "some updated MARKETINGCATEGORYNAME", NDC_EXCLUDE_FLAG: "some updated NDC_EXCLUDE_FLAG", NONPROPRIETARYNAME: "some updated NONPROPRIETARYNAME", PHARM_CLASSES: "some updated PHARM_CLASSES", PRODUCTID: "some updated PRODUCTID", PRODUCTNDC: "some updated PRODUCTNDC", PRODUCTTYPENAME: "some updated PRODUCTTYPENAME", PROPRIETARYNAME: "some updated PROPRIETARYNAME", PROPRIETARYNAMESUFFIX: "some updated PROPRIETARYNAMESUFFIX", ROUTENAME: "some updated ROUTENAME", STARTMARKETINGDATE: "some updated STARTMARKETINGDATE", SUBSTANCENAME: "some updated SUBSTANCENAME"}
  @invalid_attrs %{ACTIVE_INGRED_UNIT: nil, ACTIVE_NUMERATOR_STRENGTH: nil, APPLICATIONNUMBER: nil, DEASCHEDULE: nil, DOSAGEFORMNAME: nil, ENDMARKETINGDATE: nil, LABELERNAME: nil, LISTING_RECORD_CERTIFIED_THROUGH: nil, MARKETINGCATEGORYNAME: nil, NDC_EXCLUDE_FLAG: nil, NONPROPRIETARYNAME: nil, PHARM_CLASSES: nil, PRODUCTID: nil, PRODUCTNDC: nil, PRODUCTTYPENAME: nil, PROPRIETARYNAME: nil, PROPRIETARYNAMESUFFIX: nil, ROUTENAME: nil, STARTMARKETINGDATE: nil, SUBSTANCENAME: nil}

  def fixture(:ndc_product) do
    {:ok, ndc_product} = Codes.create_ndc_product(@create_attrs)
    ndc_product
  end

  describe "index" do
    test "lists all ndc_products", %{conn: conn} do
      conn = get(conn, Routes.ndc_product_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ndc products"
    end
  end

  describe "new ndc_product" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ndc_product_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ndc product"
    end
  end

  describe "create ndc_product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ndc_product_path(conn, :create), ndc_product: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ndc_product_path(conn, :show, id)

      conn = get(conn, Routes.ndc_product_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ndc product"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ndc_product_path(conn, :create), ndc_product: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ndc product"
    end
  end

  describe "edit ndc_product" do
    setup [:create_ndc_product]

    test "renders form for editing chosen ndc_product", %{conn: conn, ndc_product: ndc_product} do
      conn = get(conn, Routes.ndc_product_path(conn, :edit, ndc_product))
      assert html_response(conn, 200) =~ "Edit Ndc product"
    end
  end

  describe "update ndc_product" do
    setup [:create_ndc_product]

    test "redirects when data is valid", %{conn: conn, ndc_product: ndc_product} do
      conn = put(conn, Routes.ndc_product_path(conn, :update, ndc_product), ndc_product: @update_attrs)
      assert redirected_to(conn) == Routes.ndc_product_path(conn, :show, ndc_product)

      conn = get(conn, Routes.ndc_product_path(conn, :show, ndc_product))
      assert html_response(conn, 200) =~ "some updated ACTIVE_INGRED_UNIT"
    end

    test "renders errors when data is invalid", %{conn: conn, ndc_product: ndc_product} do
      conn = put(conn, Routes.ndc_product_path(conn, :update, ndc_product), ndc_product: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ndc product"
    end
  end

  describe "delete ndc_product" do
    setup [:create_ndc_product]

    test "deletes chosen ndc_product", %{conn: conn, ndc_product: ndc_product} do
      conn = delete(conn, Routes.ndc_product_path(conn, :delete, ndc_product))
      assert redirected_to(conn) == Routes.ndc_product_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.ndc_product_path(conn, :show, ndc_product))
      end
    end
  end

  defp create_ndc_product(_) do
    ndc_product = fixture(:ndc_product)
    %{ndc_product: ndc_product}
  end
end
