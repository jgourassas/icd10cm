defmodule Icd10cmWeb.Icd10pcs_defsControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    axis_code: "some axis_code",
    axis_title: "some axis_title",
    section: "some section",
    section_title: "some section_title",
    term_definition: "some term_definition",
    term_explanation: "some term_explanation",
    term_includes: "some term_includes",
    term_titles: "some term_titles",
    terms: "some terms",
    title_tsv: "some title_tsv"
  }
  @update_attrs %{
    axis_code: "some updated axis_code",
    axis_title: "some updated axis_title",
    section: "some updated section",
    section_title: "some updated section_title",
    term_definition: "some updated term_definition",
    term_explanation: "some updated term_explanation",
    term_includes: "some updated term_includes",
    term_titles: "some updated term_titles",
    terms: "some updated terms",
    title_tsv: "some updated title_tsv"
  }
  @invalid_attrs %{
    axis_code: nil,
    axis_title: nil,
    section: nil,
    section_title: nil,
    term_definition: nil,
    term_explanation: nil,
    term_includes: nil,
    term_titles: nil,
    terms: nil,
    title_tsv: nil
  }

  def fixture(:icd10pcs_defs) do
    {:ok, icd10pcs_defs} = Codes.create_icd10pcs_defs(@create_attrs)
    icd10pcs_defs
  end

  describe "index" do
    test "lists all icd10pcs_defs", %{conn: conn} do
      conn = get(conn, Routes.icd10pcs_defs_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Icd10pcs defs"
    end
  end

  describe "new icd10pcs_defs" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10pcs_defs_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10pcs defs"
    end
  end

  describe "create icd10pcs_defs" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10pcs_defs_path(conn, :create), icd10pcs_defs: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10pcs_defs_path(conn, :show, id)

      conn = get(conn, Routes.icd10pcs_defs_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10pcs defs"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10pcs_defs_path(conn, :create), icd10pcs_defs: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10pcs defs"
    end
  end

  describe "edit icd10pcs_defs" do
    setup [:create_icd10pcs_defs]

    test "renders form for editing chosen icd10pcs_defs", %{
      conn: conn,
      icd10pcs_defs: icd10pcs_defs
    } do
      conn = get(conn, Routes.icd10pcs_defs_path(conn, :edit, icd10pcs_defs))
      assert html_response(conn, 200) =~ "Edit Icd10pcs defs"
    end
  end

  describe "update icd10pcs_defs" do
    setup [:create_icd10pcs_defs]

    test "redirects when data is valid", %{conn: conn, icd10pcs_defs: icd10pcs_defs} do
      conn =
        put(conn, Routes.icd10pcs_defs_path(conn, :update, icd10pcs_defs),
          icd10pcs_defs: @update_attrs
        )

      assert redirected_to(conn) == Routes.icd10pcs_defs_path(conn, :show, icd10pcs_defs)

      conn = get(conn, Routes.icd10pcs_defs_path(conn, :show, icd10pcs_defs))
      assert html_response(conn, 200) =~ "some updated axis_code"
    end

    test "renders errors when data is invalid", %{conn: conn, icd10pcs_defs: icd10pcs_defs} do
      conn =
        put(conn, Routes.icd10pcs_defs_path(conn, :update, icd10pcs_defs),
          icd10pcs_defs: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Icd10pcs defs"
    end
  end

  describe "delete icd10pcs_defs" do
    setup [:create_icd10pcs_defs]

    test "deletes chosen icd10pcs_defs", %{conn: conn, icd10pcs_defs: icd10pcs_defs} do
      conn = delete(conn, Routes.icd10pcs_defs_path(conn, :delete, icd10pcs_defs))
      assert redirected_to(conn) == Routes.icd10pcs_defs_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10pcs_defs_path(conn, :show, icd10pcs_defs))
      end
    end
  end

  defp create_icd10pcs_defs(_) do
    icd10pcs_defs = fixture(:icd10pcs_defs)
    %{icd10pcs_defs: icd10pcs_defs}
  end
end
