defmodule Icd10cmWeb.Icd10clinicalControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    chapter_description: "some chapter_description",
    chapter_name: 42,
    codealso: "some codealso",
    codefirst: "some codefirst",
    excludes1: "some excludes1",
    excludes2: "some excludes2",
    icd10cm_code: "some icd10cm_code",
    icd10cm_code_2: "some icd10cm_code_2",
    icd10cm_code_2_ltree: "some icd10cm_code_2_ltree",
    icd10cm_code_ltree: "some icd10cm_code_ltree",
    includes: "some includes",
    inclusionterm: "some inclusionterm",
    is_category: "some is_category",
    is_header: "some is_header",
    is_subcategory: "some is_subcategory",
    long_description: "some long_description",
    order_number: 42,
    section_description: "some section_description",
    section_id: "some section_id",
    short_description: "some short_description",
    useadditionalcode: "some useadditionalcode"
  }
  @update_attrs %{
    chapter_description: "some updated chapter_description",
    chapter_name: 43,
    codealso: "some updated codealso",
    codefirst: "some updated codefirst",
    excludes1: "some updated excludes1",
    excludes2: "some updated excludes2",
    icd10cm_code: "some updated icd10cm_code",
    icd10cm_code_2: "some updated icd10cm_code_2",
    icd10cm_code_2_ltree: "some updated icd10cm_code_2_ltree",
    icd10cm_code_ltree: "some updated icd10cm_code_ltree",
    includes: "some updated includes",
    inclusionterm: "some updated inclusionterm",
    is_category: "some updated is_category",
    is_header: "some updated is_header",
    is_subcategory: "some updated is_subcategory",
    long_description: "some updated long_description",
    order_number: 43,
    section_description: "some updated section_description",
    section_id: "some updated section_id",
    short_description: "some updated short_description",
    useadditionalcode: "some updated useadditionalcode"
  }
  @invalid_attrs %{
    chapter_description: nil,
    chapter_name: nil,
    codealso: nil,
    codefirst: nil,
    excludes1: nil,
    excludes2: nil,
    icd10cm_code: nil,
    icd10cm_code_2: nil,
    icd10cm_code_2_ltree: nil,
    icd10cm_code_ltree: nil,
    includes: nil,
    inclusionterm: nil,
    is_category: nil,
    is_header: nil,
    is_subcategory: nil,
    long_description: nil,
    order_number: nil,
    section_description: nil,
    section_id: nil,
    short_description: nil,
    useadditionalcode: nil
  }

  def fixture(:icd10clinical) do
    {:ok, icd10clinical} = Codes.create_icd10clinical(@create_attrs)
    icd10clinical
  end

  describe "index" do
    test "lists all icd10clinicals", %{conn: conn} do
      conn = get(conn, Routes.icd10clinical_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Icd10clinicals"
    end
  end

  describe "new icd10clinical" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10clinical_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10clinical"
    end
  end

  describe "create icd10clinical" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10clinical_path(conn, :create), icd10clinical: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10clinical_path(conn, :show, id)

      conn = get(conn, Routes.icd10clinical_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10clinical"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10clinical_path(conn, :create), icd10clinical: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10clinical"
    end
  end

  describe "edit icd10clinical" do
    setup [:create_icd10clinical]

    test "renders form for editing chosen icd10clinical", %{
      conn: conn,
      icd10clinical: icd10clinical
    } do
      conn = get(conn, Routes.icd10clinical_path(conn, :edit, icd10clinical))
      assert html_response(conn, 200) =~ "Edit Icd10clinical"
    end
  end

  describe "update icd10clinical" do
    setup [:create_icd10clinical]

    test "redirects when data is valid", %{conn: conn, icd10clinical: icd10clinical} do
      conn =
        put(conn, Routes.icd10clinical_path(conn, :update, icd10clinical),
          icd10clinical: @update_attrs
        )

      assert redirected_to(conn) == Routes.icd10clinical_path(conn, :show, icd10clinical)

      conn = get(conn, Routes.icd10clinical_path(conn, :show, icd10clinical))
      assert html_response(conn, 200) =~ "some updated chapter_description"
    end

    test "renders errors when data is invalid", %{conn: conn, icd10clinical: icd10clinical} do
      conn =
        put(conn, Routes.icd10clinical_path(conn, :update, icd10clinical),
          icd10clinical: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Icd10clinical"
    end
  end

  describe "delete icd10clinical" do
    setup [:create_icd10clinical]

    test "deletes chosen icd10clinical", %{conn: conn, icd10clinical: icd10clinical} do
      conn = delete(conn, Routes.icd10clinical_path(conn, :delete, icd10clinical))
      assert redirected_to(conn) == Routes.icd10clinical_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10clinical_path(conn, :show, icd10clinical))
      end
    end
  end

  defp create_icd10clinical(_) do
    icd10clinical = fixture(:icd10clinical)
    %{icd10clinical: icd10clinical}
  end
end
