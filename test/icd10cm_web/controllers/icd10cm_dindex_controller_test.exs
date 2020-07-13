defmodule Icd10cmWeb.Icd10cm_dindexControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{main_term: %{}, title: "some title", title_tsv: "some title_tsv"}
  @update_attrs %{
    main_term: %{},
    title: "some updated title",
    title_tsv: "some updated title_tsv"
  }
  @invalid_attrs %{main_term: nil, title: nil, title_tsv: nil}

  def fixture(:icd10cm_dindex) do
    {:ok, icd10cm_dindex} = Codes.create_icd10cm_dindex(@create_attrs)
    icd10cm_dindex
  end

  describe "index" do
    test "lists all icd10cm_dindexes", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_dindex_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Icd10cm dindexes"
    end
  end

  describe "new icd10cm_dindex" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.icd10cm_dindex_path(conn, :new))
      assert html_response(conn, 200) =~ "New Icd10cm dindex"
    end
  end

  describe "create icd10cm_dindex" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_dindex_path(conn, :create), icd10cm_dindex: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.icd10cm_dindex_path(conn, :show, id)

      conn = get(conn, Routes.icd10cm_dindex_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Icd10cm dindex"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.icd10cm_dindex_path(conn, :create), icd10cm_dindex: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Icd10cm dindex"
    end
  end

  describe "edit icd10cm_dindex" do
    setup [:create_icd10cm_dindex]

    test "renders form for editing chosen icd10cm_dindex", %{
      conn: conn,
      icd10cm_dindex: icd10cm_dindex
    } do
      conn = get(conn, Routes.icd10cm_dindex_path(conn, :edit, icd10cm_dindex))
      assert html_response(conn, 200) =~ "Edit Icd10cm dindex"
    end
  end

  describe "update icd10cm_dindex" do
    setup [:create_icd10cm_dindex]

    test "redirects when data is valid", %{conn: conn, icd10cm_dindex: icd10cm_dindex} do
      conn =
        put(conn, Routes.icd10cm_dindex_path(conn, :update, icd10cm_dindex),
          icd10cm_dindex: @update_attrs
        )

      assert redirected_to(conn) == Routes.icd10cm_dindex_path(conn, :show, icd10cm_dindex)

      conn = get(conn, Routes.icd10cm_dindex_path(conn, :show, icd10cm_dindex))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, icd10cm_dindex: icd10cm_dindex} do
      conn =
        put(conn, Routes.icd10cm_dindex_path(conn, :update, icd10cm_dindex),
          icd10cm_dindex: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Icd10cm dindex"
    end
  end

  describe "delete icd10cm_dindex" do
    setup [:create_icd10cm_dindex]

    test "deletes chosen icd10cm_dindex", %{conn: conn, icd10cm_dindex: icd10cm_dindex} do
      conn = delete(conn, Routes.icd10cm_dindex_path(conn, :delete, icd10cm_dindex))
      assert redirected_to(conn) == Routes.icd10cm_dindex_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.icd10cm_dindex_path(conn, :show, icd10cm_dindex))
      end
    end
  end

  defp create_icd10cm_dindex(_) do
    icd10cm_dindex = fixture(:icd10cm_dindex)
    %{icd10cm_dindex: icd10cm_dindex}
  end
end
