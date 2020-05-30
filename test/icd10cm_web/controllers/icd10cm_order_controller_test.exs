defmodule Icd10cmWeb.Icd10cm_orderControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    " ": "some  ",
    icd10cm_code: "some icd10cm_code",
    is_header: "some is_header",
    order_number: 42,
    short_description: "some short_description"
  }
  @update_attrs %{
    " ": "some updated  ",
    icd10cm_code: "some updated icd10cm_code",
    is_header: "some updated is_header",
    order_number: 43,
    short_description: "some updated short_description"
  }
  @invalid_attrs %{
    " ": nil,
    icd10cm_code: nil,
    is_header: nil,
    order_number: nil,
    short_description: nil
  }

  def fixture(:icd10cm_order) do
    {:ok, icd10cm_order} = Codes.create_icd10cm_order(@create_attrs)
    icd10cm_order
  end

  describe "index" do
    test "lists all iicd10cm_orders", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_order_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Iicd10cm orders"
    end
  end

  describe "new icd10cm_order" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_order_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10cm order"
    end
  end

  describe "create icd10cm_order" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_order_path(conn, :create), icd10cm_order: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10cm_order_path(conn, :show, id)

      conn = get(conn, Routes.icd10cm_order_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10cm order"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_order_path(conn, :create), icd10cm_order: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10cm order"
    end
  end

  describe "edit icd10cm_order" do
    setup [:create_icd10cm_order]

    test "renders form for editing chosen icd10cm_order", %{
      conn: conn,
      icd10cm_order: icd10cm_order
    } do
      conn = get(conn, Routes.icd10cm_order_path(conn, :edit, icd10cm_order))
      assert html_response(conn, 200) =~ "Edit Icd10cm order"
    end
  end

  describe "update icd10cm_order" do
    setup [:create_icd10cm_order]

    test "redirects when data is valid", %{conn: conn, icd10cm_order: icd10cm_order} do
      conn =
        put(conn, Routes.icd10cm_order_path(conn, :update, icd10cm_order),
          icd10cm_order: @update_attrs
        )

      assert redirected_to(conn) == Routes.icd10cm_order_path(conn, :show, icd10cm_order)

      conn = get(conn, Routes.icd10cm_order_path(conn, :show, icd10cm_order))
      assert html_response(conn, 200) =~ "some updated  "
    end

    test "renders errors when data is invalid", %{conn: conn, icd10cm_order: icd10cm_order} do
      conn =
        put(conn, Routes.icd10cm_order_path(conn, :update, icd10cm_order),
          icd10cm_order: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Icd10cm order"
    end
  end

  describe "delete icd10cm_order" do
    setup [:create_icd10cm_order]

    test "deletes chosen icd10cm_order", %{conn: conn, icd10cm_order: icd10cm_order} do
      conn = delete(conn, Routes.icd10cm_order_path(conn, :delete, icd10cm_order))
      assert redirected_to(conn) == Routes.icd10cm_order_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10cm_order_path(conn, :show, icd10cm_order))
      end
    end
  end

  defp create_icd10cm_order(_) do
    icd10cm_order = fixture(:icd10cm_order)
    %{icd10cm_order: icd10cm_order}
  end
end
