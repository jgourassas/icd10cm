defmodule Icd10cmWeb.CtdControllerTest do
  use Icd10cmWeb.ConnCase

  alias Icd10cm.Codes

  @create_attrs %{
    altdiseaseids: "some altdiseaseids",
    definition: "some definition",
    diseaseid: "some diseaseid",
    diseasename: "some diseasename",
    parentids: "some parentids",
    parenttreenumbers: "some parenttreenumbers",
    slimmappings: "some slimmappings",
    synonyms: "some synonyms",
    treenumbers: "some treenumbers"
  }
  @update_attrs %{
    altdiseaseids: "some updated altdiseaseids",
    definition: "some updated definition",
    diseaseid: "some updated diseaseid",
    diseasename: "some updated diseasename",
    parentids: "some updated parentids",
    parenttreenumbers: "some updated parenttreenumbers",
    slimmappings: "some updated slimmappings",
    synonyms: "some updated synonyms",
    treenumbers: "some updated treenumbers"
  }
  @invalid_attrs %{
    altdiseaseids: nil,
    definition: nil,
    diseaseid: nil,
    diseasename: nil,
    parentids: nil,
    parenttreenumbers: nil,
    slimmappings: nil,
    synonyms: nil,
    treenumbers: nil
  }

  def fixture(:ctd) do
    {:ok, ctd} = Codes.create_ctd(@create_attrs)
    ctd
  end

  describe "index" do
    test "lists all ctds", %{conn: conn} do
      conn = get(conn, Routes.ctd_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ctds"
    end
  end

  describe "new ctd" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ctd_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ctd"
    end
  end

  describe "create ctd" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ctd_path(conn, :create), ctd: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ctd_path(conn, :show, id)

      conn = get(conn, Routes.ctd_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ctd"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ctd_path(conn, :create), ctd: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ctd"
    end
  end

  describe "edit ctd" do
    setup [:create_ctd]

    test "renders form for editing chosen ctd", %{conn: conn, ctd: ctd} do
      conn = get(conn, Routes.ctd_path(conn, :edit, ctd))
      assert html_response(conn, 200) =~ "Edit Ctd"
    end
  end

  describe "update ctd" do
    setup [:create_ctd]

    test "redirects when data is valid", %{conn: conn, ctd: ctd} do
      conn = put(conn, Routes.ctd_path(conn, :update, ctd), ctd: @update_attrs)
      assert redirected_to(conn) == Routes.ctd_path(conn, :show, ctd)

      conn = get(conn, Routes.ctd_path(conn, :show, ctd))
      assert html_response(conn, 200) =~ "some updated altdiseaseids"
    end

    test "renders errors when data is invalid", %{conn: conn, ctd: ctd} do
      conn = put(conn, Routes.ctd_path(conn, :update, ctd), ctd: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ctd"
    end
  end

  describe "delete ctd" do
    setup [:create_ctd]

    test "deletes chosen ctd", %{conn: conn, ctd: ctd} do
      conn = delete(conn, Routes.ctd_path(conn, :delete, ctd))
      assert redirected_to(conn) == Routes.ctd_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.ctd_path(conn, :show, ctd))
      end
    end
  end

  defp create_ctd(_) do
    ctd = fixture(:ctd)
    %{ctd: ctd}
  end
end
