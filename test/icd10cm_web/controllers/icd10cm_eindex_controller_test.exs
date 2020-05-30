defmodule Icd10cmWeb.Icd10cm_eindexControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    main_term_jsonb: %{},
    main_term_text: "some main_term_text",
    title: "some title",
    title_tsv: "some title_tsv"
  }
  @update_attrs %{
    main_term_jsonb: %{},
    main_term_text: "some updated main_term_text",
    title: "some updated title",
    title_tsv: "some updated title_tsv"
  }
  @invalid_attrs %{main_term_jsonb: nil, main_term_text: nil, title: nil, title_tsv: nil}

  def fixture(:icd10cm_eindex) do
    {:ok, icd10cm_eindex} = Codes.create_icd10cm_eindex(@create_attrs)
    icd10cm_eindex
  end

  describe "index" do
    test "lists all iicd10cm_eindexes", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_eindex_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Iicd10cm eindexes"
    end
  end

  describe "new icd10cm_eindex" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_eindex_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10cm eindex"
    end
  end

  describe "create icd10cm_eindex" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_eindex_path(conn, :create), icd10cm_eindex: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10cm_eindex_path(conn, :show, id)

      conn = get(conn, Routes.icd10cm_eindex_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10cm eindex"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_eindex_path(conn, :create), icd10cm_eindex: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10cm eindex"
    end
  end

  describe "edit icd10cm_eindex" do
    setup [:create_icd10cm_eindex]

    test "renders form for editing chosen icd10cm_eindex", %{
      conn: conn,
      icd10cm_eindex: icd10cm_eindex
    } do
      conn = get(conn, Routes.icd10cm_eindex_path(conn, :edit, icd10cm_eindex))
      assert html_response(conn, 200) =~ "Edit Icd10cm eindex"
    end
  end

  describe "update icd10cm_eindex" do
    setup [:create_icd10cm_eindex]

    test "redirects when data is valid", %{conn: conn, icd10cm_eindex: icd10cm_eindex} do
      conn =
        put(conn, Routes.icd10cm_eindex_path(conn, :update, icd10cm_eindex),
          icd10cm_eindex: @update_attrs
        )

      assert redirected_to(conn) == Routes.icd10cm_eindex_path(conn, :show, icd10cm_eindex)

      conn = get(conn, Routes.icd10cm_eindex_path(conn, :show, icd10cm_eindex))
      assert html_response(conn, 200) =~ "some updated main_term_text"
    end

    test "renders errors when data is invalid", %{conn: conn, icd10cm_eindex: icd10cm_eindex} do
      conn =
        put(conn, Routes.icd10cm_eindex_path(conn, :update, icd10cm_eindex),
          icd10cm_eindex: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Icd10cm eindex"
    end
  end

  describe "delete icd10cm_eindex" do
    setup [:create_icd10cm_eindex]

    test "deletes chosen icd10cm_eindex", %{conn: conn, icd10cm_eindex: icd10cm_eindex} do
      conn = delete(conn, Routes.icd10cm_eindex_path(conn, :delete, icd10cm_eindex))
      assert redirected_to(conn) == Routes.icd10cm_eindex_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10cm_eindex_path(conn, :show, icd10cm_eindex))
      end
    end
  end

  defp create_icd10cm_eindex(_) do
    icd10cm_eindex = fixture(:icd10cm_eindex)
    %{icd10cm_eindex: icd10cm_eindex}
  end
end
