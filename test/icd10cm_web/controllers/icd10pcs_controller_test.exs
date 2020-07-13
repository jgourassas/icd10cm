defmodule Icd10cmWeb.Icd10pcsControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    approach: "some approach",
    approach_title: "some approach_title",
    body_part: "some body_part",
    body_part_title: "some body_part_title",
    body_system: "some body_system",
    body_system_title: "some body_system_title",
    device: "some device",
    device_title: "some device_title",
    icd10pcs_code: "some icd10pcs_code",
    icd10pcs_code_2: "some icd10pcs_code_2",
    icd10pcs_code_2_ltree: "some icd10pcs_code_2_ltree",
    icd10pcs_code_ltree: "some icd10pcs_code_ltree",
    is_header: "some is_header",
    long_description: "some long_description",
    order_number: 42,
    qualifier: "some qualifier",
    qualifier_title: "some qualifier_title",
    root_operation: "some root_operation",
    root_operation_title: "some root_operation_title",
    section: "some section",
    section_title: "some section_title",
    short_description: "some short_description"
  }
  @update_attrs %{
    approach: "some updated approach",
    approach_title: "some updated approach_title",
    body_part: "some updated body_part",
    body_part_title: "some updated body_part_title",
    body_system: "some updated body_system",
    body_system_title: "some updated body_system_title",
    device: "some updated device",
    device_title: "some updated device_title",
    icd10pcs_code: "some updated icd10pcs_code",
    icd10pcs_code_2: "some updated icd10pcs_code_2",
    icd10pcs_code_2_ltree: "some updated icd10pcs_code_2_ltree",
    icd10pcs_code_ltree: "some updated icd10pcs_code_ltree",
    is_header: "some updated is_header",
    long_description: "some updated long_description",
    order_number: 43,
    qualifier: "some updated qualifier",
    qualifier_title: "some updated qualifier_title",
    root_operation: "some updated root_operation",
    root_operation_title: "some updated root_operation_title",
    section: "some updated section",
    section_title: "some updated section_title",
    short_description: "some updated short_description"
  }
  @invalid_attrs %{
    approach: nil,
    approach_title: nil,
    body_part: nil,
    body_part_title: nil,
    body_system: nil,
    body_system_title: nil,
    device: nil,
    device_title: nil,
    icd10pcs_code: nil,
    icd10pcs_code_2: nil,
    icd10pcs_code_2_ltree: nil,
    icd10pcs_code_ltree: nil,
    is_header: nil,
    long_description: nil,
    order_number: nil,
    qualifier: nil,
    qualifier_title: nil,
    root_operation: nil,
    root_operation_title: nil,
    section: nil,
    section_title: nil,
    short_description: nil
  }

  def fixture(:icd10pcs) do
    {:ok, icd10pcs} = Codes.create_icd10pcs(@create_attrs)
    icd10pcs
  end

  describe "index" do
    test "lists all icd10_pcses", %{conn: conn} do
      conn = get(conn, Routes.icd10pcs_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Icd10 pcses"
    end
  end

  describe "new icd10pcs" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10pcs_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10pcs"
    end
  end

  describe "create icd10pcs" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10pcs_path(conn, :create), icd10pcs: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10pcs_path(conn, :show, id)

      conn = get(conn, Routes.icd10pcs_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10pcs"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10pcs_path(conn, :create), icd10pcs: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10pcs"
    end
  end

  describe "edit icd10pcs" do
    setup [:create_icd10pcs]

    test "renders form for editing chosen icd10pcs", %{conn: conn, icd10pcs: icd10pcs} do
      conn = get(conn, Routes.icd10pcs_path(conn, :edit, icd10pcs))
      assert html_response(conn, 200) =~ "Edit Icd10pcs"
    end
  end

  describe "update icd10pcs" do
    setup [:create_icd10pcs]

    test "redirects when data is valid", %{conn: conn, icd10pcs: icd10pcs} do
      conn = put(conn, Routes.icd10pcs_path(conn, :update, icd10pcs), icd10pcs: @update_attrs)
      assert redirected_to(conn) == Routes.icd10pcs_path(conn, :show, icd10pcs)

      conn = get(conn, Routes.icd10pcs_path(conn, :show, icd10pcs))
      assert html_response(conn, 200) =~ "some updated approach"
    end

    test "renders errors when data is invalid", %{conn: conn, icd10pcs: icd10pcs} do
      conn = put(conn, Routes.icd10pcs_path(conn, :update, icd10pcs), icd10pcs: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Icd10pcs"
    end
  end

  describe "delete icd10pcs" do
    setup [:create_icd10pcs]

    test "deletes chosen icd10pcs", %{conn: conn, icd10pcs: icd10pcs} do
      conn = delete(conn, Routes.icd10pcs_path(conn, :delete, icd10pcs))
      assert redirected_to(conn) == Routes.icd10pcs_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10pcs_path(conn, :show, icd10pcs))
      end
    end
  end

  defp create_icd10pcs(_) do
    icd10pcs = fixture(:icd10pcs)
    %{icd10pcs: icd10pcs}
  end
end
