defmodule Icd10cm.CodesTest do
  use Icd10cm.DataCase

  alias Icd10cm.Codes

  describe "icd10clinicals" do
    alias Icd10cm.Codes.Icd10clinical

    @valid_attrs %{
      " ": "some  ",
      icd10cm_code: "some icd10cm_code",
      icd10cm_code_2: "some icd10cm_code_2",
      order_number: 42
    }
    @update_attrs %{
      " ": "some updated  ",
      icd10cm_code: "some updated icd10cm_code",
      icd10cm_code_2: "some updated icd10cm_code_2",
      order_number: 43
    }
    @invalid_attrs %{" ": nil, icd10cm_code: nil, icd10cm_code_2: nil, order_number: nil}

    def icd10clinical_fixture(attrs \\ %{}) do
      {:ok, icd10clinical} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10clinical()

      icd10clinical
    end

    test "list_icd10clinicals/0 returns all icd10clinicals" do
      icd10clinical = icd10clinical_fixture()
      assert Codes.list_icd10clinicals() == [icd10clinical]
    end

    test "get_icd10clinical!/1 returns the icd10clinical with given id" do
      icd10clinical = icd10clinical_fixture()
      assert Codes.get_icd10clinical!(icd10clinical.id) == icd10clinical
    end

    test "create_icd10clinical/1 with valid data creates a icd10clinical" do
      assert {:ok, %Icd10clinical{} = icd10clinical} = Codes.create_icd10clinical(@valid_attrs)
      assert icd10clinical.==("some  ")
      assert icd10clinical.icd10cm_code == "some icd10cm_code"
      assert icd10clinical.icd10cm_code_2 == "some icd10cm_code_2"
      assert icd10clinical.order_number == 42
    end

    test "create_icd10clinical/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10clinical(@invalid_attrs)
    end

    test "update_icd10clinical/2 with valid data updates the icd10clinical" do
      icd10clinical = icd10clinical_fixture()

      assert {:ok, %Icd10clinical{} = icd10clinical} =
               Codes.update_icd10clinical(icd10clinical, @update_attrs)

      assert icd10clinical.==("some updated  ")
      assert icd10clinical.icd10cm_code == "some updated icd10cm_code"
      assert icd10clinical.icd10cm_code_2 == "some updated icd10cm_code_2"
      assert icd10clinical.order_number == 43
    end

    test "update_icd10clinical/2 with invalid data returns error changeset" do
      icd10clinical = icd10clinical_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10clinical(icd10clinical, @invalid_attrs)

      assert icd10clinical == Codes.get_icd10clinical!(icd10clinical.id)
    end

    test "delete_icd10clinical/1 deletes the icd10clinical" do
      icd10clinical = icd10clinical_fixture()
      assert {:ok, %Icd10clinical{}} = Codes.delete_icd10clinical(icd10clinical)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10clinical!(icd10clinical.id) end
    end

    test "change_icd10clinical/1 returns a icd10clinical changeset" do
      icd10clinical = icd10clinical_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10clinical(icd10clinical)
    end
  end

  describe "icd10clinicals" do
    alias Icd10cm.Codes.Icd10clinical

    @valid_attrs %{
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

    def icd10clinical_fixture(attrs \\ %{}) do
      {:ok, icd10clinical} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10clinical()

      icd10clinical
    end

    test "list_icd10clinicals/0 returns all icd10clinicals" do
      icd10clinical = icd10clinical_fixture()
      assert Codes.list_icd10clinicals() == [icd10clinical]
    end

    test "get_icd10clinical!/1 returns the icd10clinical with given id" do
      icd10clinical = icd10clinical_fixture()
      assert Codes.get_icd10clinical!(icd10clinical.id) == icd10clinical
    end

    test "create_icd10clinical/1 with valid data creates a icd10clinical" do
      assert {:ok, %Icd10clinical{} = icd10clinical} = Codes.create_icd10clinical(@valid_attrs)
      assert icd10clinical.chapter_description == "some chapter_description"
      assert icd10clinical.chapter_name == 42
      assert icd10clinical.codealso == "some codealso"
      assert icd10clinical.codefirst == "some codefirst"
      assert icd10clinical.excludes1 == "some excludes1"
      assert icd10clinical.excludes2 == "some excludes2"
      assert icd10clinical.icd10cm_code == "some icd10cm_code"
      assert icd10clinical.icd10cm_code_2 == "some icd10cm_code_2"
      assert icd10clinical.icd10cm_code_2_ltree == "some icd10cm_code_2_ltree"
      assert icd10clinical.icd10cm_code_ltree == "some icd10cm_code_ltree"
      assert icd10clinical.includes == "some includes"
      assert icd10clinical.inclusionterm == "some inclusionterm"
      assert icd10clinical.is_category == "some is_category"
      assert icd10clinical.is_header == "some is_header"
      assert icd10clinical.is_subcategory == "some is_subcategory"
      assert icd10clinical.long_description == "some long_description"
      assert icd10clinical.order_number == 42
      assert icd10clinical.section_description == "some section_description"
      assert icd10clinical.section_id == "some section_id"
      assert icd10clinical.short_description == "some short_description"
      assert icd10clinical.useadditionalcode == "some useadditionalcode"
    end

    test "create_icd10clinical/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10clinical(@invalid_attrs)
    end

    test "update_icd10clinical/2 with valid data updates the icd10clinical" do
      icd10clinical = icd10clinical_fixture()

      assert {:ok, %Icd10clinical{} = icd10clinical} =
               Codes.update_icd10clinical(icd10clinical, @update_attrs)

      assert icd10clinical.chapter_description == "some updated chapter_description"
      assert icd10clinical.chapter_name == 43
      assert icd10clinical.codealso == "some updated codealso"
      assert icd10clinical.codefirst == "some updated codefirst"
      assert icd10clinical.excludes1 == "some updated excludes1"
      assert icd10clinical.excludes2 == "some updated excludes2"
      assert icd10clinical.icd10cm_code == "some updated icd10cm_code"
      assert icd10clinical.icd10cm_code_2 == "some updated icd10cm_code_2"
      assert icd10clinical.icd10cm_code_2_ltree == "some updated icd10cm_code_2_ltree"
      assert icd10clinical.icd10cm_code_ltree == "some updated icd10cm_code_ltree"
      assert icd10clinical.includes == "some updated includes"
      assert icd10clinical.inclusionterm == "some updated inclusionterm"
      assert icd10clinical.is_category == "some updated is_category"
      assert icd10clinical.is_header == "some updated is_header"
      assert icd10clinical.is_subcategory == "some updated is_subcategory"
      assert icd10clinical.long_description == "some updated long_description"
      assert icd10clinical.order_number == 43
      assert icd10clinical.section_description == "some updated section_description"
      assert icd10clinical.section_id == "some updated section_id"
      assert icd10clinical.short_description == "some updated short_description"
      assert icd10clinical.useadditionalcode == "some updated useadditionalcode"
    end

    test "update_icd10clinical/2 with invalid data returns error changeset" do
      icd10clinical = icd10clinical_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10clinical(icd10clinical, @invalid_attrs)

      assert icd10clinical == Codes.get_icd10clinical!(icd10clinical.id)
    end

    test "delete_icd10clinical/1 deletes the icd10clinical" do
      icd10clinical = icd10clinical_fixture()
      assert {:ok, %Icd10clinical{}} = Codes.delete_icd10clinical(icd10clinical)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10clinical!(icd10clinical.id) end
    end

    test "change_icd10clinical/1 returns a icd10clinical changeset" do
      icd10clinical = icd10clinical_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10clinical(icd10clinical)
    end
  end

  describe "icd10cm_neoplasms" do
    alias Icd10cm.Codes.Icd10cm_neoplasm

    @valid_attrs %{main_term: %{}, title: "some title", title_tsv: "some title_tsv"}
    @update_attrs %{
      main_term: %{},
      title: "some updated title",
      title_tsv: "some updated title_tsv"
    }
    @invalid_attrs %{main_term: nil, title: nil, title_tsv: nil}

    def icd10cm_neoplasm_fixture(attrs \\ %{}) do
      {:ok, icd10cm_neoplasm} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10cm_neoplasm()

      icd10cm_neoplasm
    end

    test "list_icd10cm_neoplasms/0 returns all icd10cm_neoplasms" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()
      assert Codes.list_icd10cm_neoplasms() == [icd10cm_neoplasm]
    end

    test "get_icd10cm_neoplasm!/1 returns the icd10cm_neoplasm with given id" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()
      assert Codes.get_icd10cm_neoplasm!(icd10cm_neoplasm.id) == icd10cm_neoplasm
    end

    test "create_icd10cm_neoplasm/1 with valid data creates a icd10cm_neoplasm" do
      assert {:ok, %Icd10cm_neoplasm{} = icd10cm_neoplasm} =
               Codes.create_icd10cm_neoplasm(@valid_attrs)

      assert icd10cm_neoplasm.main_term == %{}
      assert icd10cm_neoplasm.title == "some title"
      assert icd10cm_neoplasm.title_tsv == "some title_tsv"
    end

    test "create_icd10cm_neoplasm/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10cm_neoplasm(@invalid_attrs)
    end

    test "update_icd10cm_neoplasm/2 with valid data updates the icd10cm_neoplasm" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()

      assert {:ok, %Icd10cm_neoplasm{} = icd10cm_neoplasm} =
               Codes.update_icd10cm_neoplasm(icd10cm_neoplasm, @update_attrs)

      assert icd10cm_neoplasm.main_term == %{}
      assert icd10cm_neoplasm.title == "some updated title"
      assert icd10cm_neoplasm.title_tsv == "some updated title_tsv"
    end

    test "update_icd10cm_neoplasm/2 with invalid data returns error changeset" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10cm_neoplasm(icd10cm_neoplasm, @invalid_attrs)

      assert icd10cm_neoplasm == Codes.get_icd10cm_neoplasm!(icd10cm_neoplasm.id)
    end

    test "delete_icd10cm_neoplasm/1 deletes the icd10cm_neoplasm" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()
      assert {:ok, %Icd10cm_neoplasm{}} = Codes.delete_icd10cm_neoplasm(icd10cm_neoplasm)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10cm_neoplasm!(icd10cm_neoplasm.id) end
    end

    test "change_icd10cm_neoplasm/1 returns a icd10cm_neoplasm changeset" do
      icd10cm_neoplasm = icd10cm_neoplasm_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10cm_neoplasm(icd10cm_neoplasm)
    end
  end

  describe "iicd10cm_eindexes" do
    alias Icd10cm.Codes.Icd10cm_eindex

    @valid_attrs %{
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

    def icd10cm_eindex_fixture(attrs \\ %{}) do
      {:ok, icd10cm_eindex} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10cm_eindex()

      icd10cm_eindex
    end

    test "list_iicd10cm_eindexes/0 returns all iicd10cm_eindexes" do
      icd10cm_eindex = icd10cm_eindex_fixture()
      assert Codes.list_iicd10cm_eindexes() == [icd10cm_eindex]
    end

    test "get_icd10cm_eindex!/1 returns the icd10cm_eindex with given id" do
      icd10cm_eindex = icd10cm_eindex_fixture()
      assert Codes.get_icd10cm_eindex!(icd10cm_eindex.id) == icd10cm_eindex
    end

    test "create_icd10cm_eindex/1 with valid data creates a icd10cm_eindex" do
      assert {:ok, %Icd10cm_eindex{} = icd10cm_eindex} = Codes.create_icd10cm_eindex(@valid_attrs)
      assert icd10cm_eindex.main_term_jsonb == %{}
      assert icd10cm_eindex.main_term_text == "some main_term_text"
      assert icd10cm_eindex.title == "some title"
      assert icd10cm_eindex.title_tsv == "some title_tsv"
    end

    test "create_icd10cm_eindex/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10cm_eindex(@invalid_attrs)
    end

    test "update_icd10cm_eindex/2 with valid data updates the icd10cm_eindex" do
      icd10cm_eindex = icd10cm_eindex_fixture()

      assert {:ok, %Icd10cm_eindex{} = icd10cm_eindex} =
               Codes.update_icd10cm_eindex(icd10cm_eindex, @update_attrs)

      assert icd10cm_eindex.main_term_jsonb == %{}
      assert icd10cm_eindex.main_term_text == "some updated main_term_text"
      assert icd10cm_eindex.title == "some updated title"
      assert icd10cm_eindex.title_tsv == "some updated title_tsv"
    end

    test "update_icd10cm_eindex/2 with invalid data returns error changeset" do
      icd10cm_eindex = icd10cm_eindex_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10cm_eindex(icd10cm_eindex, @invalid_attrs)

      assert icd10cm_eindex == Codes.get_icd10cm_eindex!(icd10cm_eindex.id)
    end

    test "delete_icd10cm_eindex/1 deletes the icd10cm_eindex" do
      icd10cm_eindex = icd10cm_eindex_fixture()
      assert {:ok, %Icd10cm_eindex{}} = Codes.delete_icd10cm_eindex(icd10cm_eindex)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10cm_eindex!(icd10cm_eindex.id) end
    end

    test "change_icd10cm_eindex/1 returns a icd10cm_eindex changeset" do
      icd10cm_eindex = icd10cm_eindex_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10cm_eindex(icd10cm_eindex)
    end
  end

  describe "iicd10cm_orders" do
    alias Icd10cm.Codes.Icd10cm_order

    @valid_attrs %{
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

    def icd10cm_order_fixture(attrs \\ %{}) do
      {:ok, icd10cm_order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10cm_order()

      icd10cm_order
    end

    test "list_iicd10cm_orders/0 returns all iicd10cm_orders" do
      icd10cm_order = icd10cm_order_fixture()
      assert Codes.list_iicd10cm_orders() == [icd10cm_order]
    end

    test "get_icd10cm_order!/1 returns the icd10cm_order with given id" do
      icd10cm_order = icd10cm_order_fixture()
      assert Codes.get_icd10cm_order!(icd10cm_order.id) == icd10cm_order
    end

    test "create_icd10cm_order/1 with valid data creates a icd10cm_order" do
      assert {:ok, %Icd10cm_order{} = icd10cm_order} = Codes.create_icd10cm_order(@valid_attrs)
      assert icd10cm_order.==("some  ")
      assert icd10cm_order.icd10cm_code == "some icd10cm_code"
      assert icd10cm_order.is_header == "some is_header"
      assert icd10cm_order.order_number == 42
      assert icd10cm_order.short_description == "some short_description"
    end

    test "create_icd10cm_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10cm_order(@invalid_attrs)
    end

    test "update_icd10cm_order/2 with valid data updates the icd10cm_order" do
      icd10cm_order = icd10cm_order_fixture()

      assert {:ok, %Icd10cm_order{} = icd10cm_order} =
               Codes.update_icd10cm_order(icd10cm_order, @update_attrs)

      assert icd10cm_order.==("some updated  ")
      assert icd10cm_order.icd10cm_code == "some updated icd10cm_code"
      assert icd10cm_order.is_header == "some updated is_header"
      assert icd10cm_order.order_number == 43
      assert icd10cm_order.short_description == "some updated short_description"
    end

    test "update_icd10cm_order/2 with invalid data returns error changeset" do
      icd10cm_order = icd10cm_order_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10cm_order(icd10cm_order, @invalid_attrs)

      assert icd10cm_order == Codes.get_icd10cm_order!(icd10cm_order.id)
    end

    test "delete_icd10cm_order/1 deletes the icd10cm_order" do
      icd10cm_order = icd10cm_order_fixture()
      assert {:ok, %Icd10cm_order{}} = Codes.delete_icd10cm_order(icd10cm_order)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10cm_order!(icd10cm_order.id) end
    end

    test "change_icd10cm_order/1 returns a icd10cm_order changeset" do
      icd10cm_order = icd10cm_order_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10cm_order(icd10cm_order)
    end
  end

  describe "ctds" do
    alias Icd10cm.Codes.Ctd

    @valid_attrs %{
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

    def ctd_fixture(attrs \\ %{}) do
      {:ok, ctd} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_ctd()

      ctd
    end

    test "list_ctds/0 returns all ctds" do
      ctd = ctd_fixture()
      assert Codes.list_ctds() == [ctd]
    end

    test "get_ctd!/1 returns the ctd with given id" do
      ctd = ctd_fixture()
      assert Codes.get_ctd!(ctd.id) == ctd
    end

    test "create_ctd/1 with valid data creates a ctd" do
      assert {:ok, %Ctd{} = ctd} = Codes.create_ctd(@valid_attrs)
      assert ctd.altdiseaseids == "some altdiseaseids"
      assert ctd.definition == "some definition"
      assert ctd.diseaseid == "some diseaseid"
      assert ctd.diseasename == "some diseasename"
      assert ctd.parentids == "some parentids"
      assert ctd.parenttreenumbers == "some parenttreenumbers"
      assert ctd.slimmappings == "some slimmappings"
      assert ctd.synonyms == "some synonyms"
      assert ctd.treenumbers == "some treenumbers"
    end

    test "create_ctd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_ctd(@invalid_attrs)
    end

    test "update_ctd/2 with valid data updates the ctd" do
      ctd = ctd_fixture()
      assert {:ok, %Ctd{} = ctd} = Codes.update_ctd(ctd, @update_attrs)
      assert ctd.altdiseaseids == "some updated altdiseaseids"
      assert ctd.definition == "some updated definition"
      assert ctd.diseaseid == "some updated diseaseid"
      assert ctd.diseasename == "some updated diseasename"
      assert ctd.parentids == "some updated parentids"
      assert ctd.parenttreenumbers == "some updated parenttreenumbers"
      assert ctd.slimmappings == "some updated slimmappings"
      assert ctd.synonyms == "some updated synonyms"
      assert ctd.treenumbers == "some updated treenumbers"
    end

    test "update_ctd/2 with invalid data returns error changeset" do
      ctd = ctd_fixture()
      assert {:error, %Ecto.Changeset{}} = Codes.update_ctd(ctd, @invalid_attrs)
      assert ctd == Codes.get_ctd!(ctd.id)
    end

    test "delete_ctd/1 deletes the ctd" do
      ctd = ctd_fixture()
      assert {:ok, %Ctd{}} = Codes.delete_ctd(ctd)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_ctd!(ctd.id) end
    end

    test "change_ctd/1 returns a ctd changeset" do
      ctd = ctd_fixture()
      assert %Ecto.Changeset{} = Codes.change_ctd(ctd)
    end
  end

  describe "icd10cm_dindexes" do
    alias Icd10cm.Codes.Icd10cm_dindex

    @valid_attrs %{main_term: %{}, title: "some title", title_tsv: "some title_tsv"}
    @update_attrs %{
      main_term: %{},
      title: "some updated title",
      title_tsv: "some updated title_tsv"
    }
    @invalid_attrs %{main_term: nil, title: nil, title_tsv: nil}

    def icd10cm_dindex_fixture(attrs \\ %{}) do
      {:ok, icd10cm_dindex} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10cm_dindex()

      icd10cm_dindex
    end

    test "list_icd10cm_dindexes/0 returns all icd10cm_dindexes" do
      icd10cm_dindex = icd10cm_dindex_fixture()
      assert Codes.list_icd10cm_dindexes() == [icd10cm_dindex]
    end

    test "get_icd10cm_dindex!/1 returns the icd10cm_dindex with given id" do
      icd10cm_dindex = icd10cm_dindex_fixture()
      assert Codes.get_icd10cm_dindex!(icd10cm_dindex.id) == icd10cm_dindex
    end

    test "create_icd10cm_dindex/1 with valid data creates a icd10cm_dindex" do
      assert {:ok, %Icd10cm_dindex{} = icd10cm_dindex} = Codes.create_icd10cm_dindex(@valid_attrs)
      assert icd10cm_dindex.main_term == %{}
      assert icd10cm_dindex.title == "some title"
      assert icd10cm_dindex.title_tsv == "some title_tsv"
    end

    test "create_icd10cm_dindex/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10cm_dindex(@invalid_attrs)
    end

    test "update_icd10cm_dindex/2 with valid data updates the icd10cm_dindex" do
      icd10cm_dindex = icd10cm_dindex_fixture()

      assert {:ok, %Icd10cm_dindex{} = icd10cm_dindex} =
               Codes.update_icd10cm_dindex(icd10cm_dindex, @update_attrs)

      assert icd10cm_dindex.main_term == %{}
      assert icd10cm_dindex.title == "some updated title"
      assert icd10cm_dindex.title_tsv == "some updated title_tsv"
    end

    test "update_icd10cm_dindex/2 with invalid data returns error changeset" do
      icd10cm_dindex = icd10cm_dindex_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10cm_dindex(icd10cm_dindex, @invalid_attrs)

      assert icd10cm_dindex == Codes.get_icd10cm_dindex!(icd10cm_dindex.id)
    end

    test "delete_icd10cm_dindex/1 deletes the icd10cm_dindex" do
      icd10cm_dindex = icd10cm_dindex_fixture()
      assert {:ok, %Icd10cm_dindex{}} = Codes.delete_icd10cm_dindex(icd10cm_dindex)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10cm_dindex!(icd10cm_dindex.id) end
    end

    test "change_icd10cm_dindex/1 returns a icd10cm_dindex changeset" do
      icd10cm_dindex = icd10cm_dindex_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10cm_dindex(icd10cm_dindex)
    end
  end

  describe "icd10_pcses" do
    alias Icd10cm.Codes.Icd10pcs

    @valid_attrs %{
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

    def icd10pcs_fixture(attrs \\ %{}) do
      {:ok, icd10pcs} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10pcs()

      icd10pcs
    end

    test "list_icd10_pcses/0 returns all icd10_pcses" do
      icd10pcs = icd10pcs_fixture()
      assert Codes.list_icd10_pcses() == [icd10pcs]
    end

    test "get_icd10pcs!/1 returns the icd10pcs with given id" do
      icd10pcs = icd10pcs_fixture()
      assert Codes.get_icd10pcs!(icd10pcs.id) == icd10pcs
    end

    test "create_icd10pcs/1 with valid data creates a icd10pcs" do
      assert {:ok, %Icd10pcs{} = icd10pcs} = Codes.create_icd10pcs(@valid_attrs)
      assert icd10pcs.approach == "some approach"
      assert icd10pcs.approach_title == "some approach_title"
      assert icd10pcs.body_part == "some body_part"
      assert icd10pcs.body_part_title == "some body_part_title"
      assert icd10pcs.body_system == "some body_system"
      assert icd10pcs.body_system_title == "some body_system_title"
      assert icd10pcs.device == "some device"
      assert icd10pcs.device_title == "some device_title"
      assert icd10pcs.icd10pcs_code == "some icd10pcs_code"
      assert icd10pcs.icd10pcs_code_2 == "some icd10pcs_code_2"
      assert icd10pcs.icd10pcs_code_2_ltree == "some icd10pcs_code_2_ltree"
      assert icd10pcs.icd10pcs_code_ltree == "some icd10pcs_code_ltree"
      assert icd10pcs.is_header == "some is_header"
      assert icd10pcs.long_description == "some long_description"
      assert icd10pcs.order_number == 42
      assert icd10pcs.qualifier == "some qualifier"
      assert icd10pcs.qualifier_title == "some qualifier_title"
      assert icd10pcs.root_operation == "some root_operation"
      assert icd10pcs.root_operation_title == "some root_operation_title"
      assert icd10pcs.section == "some section"
      assert icd10pcs.section_title == "some section_title"
      assert icd10pcs.short_description == "some short_description"
    end

    test "create_icd10pcs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10pcs(@invalid_attrs)
    end

    test "update_icd10pcs/2 with valid data updates the icd10pcs" do
      icd10pcs = icd10pcs_fixture()
      assert {:ok, %Icd10pcs{} = icd10pcs} = Codes.update_icd10pcs(icd10pcs, @update_attrs)
      assert icd10pcs.approach == "some updated approach"
      assert icd10pcs.approach_title == "some updated approach_title"
      assert icd10pcs.body_part == "some updated body_part"
      assert icd10pcs.body_part_title == "some updated body_part_title"
      assert icd10pcs.body_system == "some updated body_system"
      assert icd10pcs.body_system_title == "some updated body_system_title"
      assert icd10pcs.device == "some updated device"
      assert icd10pcs.device_title == "some updated device_title"
      assert icd10pcs.icd10pcs_code == "some updated icd10pcs_code"
      assert icd10pcs.icd10pcs_code_2 == "some updated icd10pcs_code_2"
      assert icd10pcs.icd10pcs_code_2_ltree == "some updated icd10pcs_code_2_ltree"
      assert icd10pcs.icd10pcs_code_ltree == "some updated icd10pcs_code_ltree"
      assert icd10pcs.is_header == "some updated is_header"
      assert icd10pcs.long_description == "some updated long_description"
      assert icd10pcs.order_number == 43
      assert icd10pcs.qualifier == "some updated qualifier"
      assert icd10pcs.qualifier_title == "some updated qualifier_title"
      assert icd10pcs.root_operation == "some updated root_operation"
      assert icd10pcs.root_operation_title == "some updated root_operation_title"
      assert icd10pcs.section == "some updated section"
      assert icd10pcs.section_title == "some updated section_title"
      assert icd10pcs.short_description == "some updated short_description"
    end

    test "update_icd10pcs/2 with invalid data returns error changeset" do
      icd10pcs = icd10pcs_fixture()
      assert {:error, %Ecto.Changeset{}} = Codes.update_icd10pcs(icd10pcs, @invalid_attrs)
      assert icd10pcs == Codes.get_icd10pcs!(icd10pcs.id)
    end

    test "delete_icd10pcs/1 deletes the icd10pcs" do
      icd10pcs = icd10pcs_fixture()
      assert {:ok, %Icd10pcs{}} = Codes.delete_icd10pcs(icd10pcs)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10pcs!(icd10pcs.id) end
    end

    test "change_icd10pcs/1 returns a icd10pcs changeset" do
      icd10pcs = icd10pcs_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10pcs(icd10pcs)
    end
  end

  describe "icd10pcs_defs" do
    alias Icd10cm.Codes.Icd10pcs_defs

    @valid_attrs %{
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

    def icd10pcs_defs_fixture(attrs \\ %{}) do
      {:ok, icd10pcs_defs} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_icd10pcs_defs()

      icd10pcs_defs
    end

    test "list_icd10pcs_defs/0 returns all icd10pcs_defs" do
      icd10pcs_defs = icd10pcs_defs_fixture()
      assert Codes.list_icd10pcs_defs() == [icd10pcs_defs]
    end

    test "get_icd10pcs_defs!/1 returns the icd10pcs_defs with given id" do
      icd10pcs_defs = icd10pcs_defs_fixture()
      assert Codes.get_icd10pcs_defs!(icd10pcs_defs.id) == icd10pcs_defs
    end

    test "create_icd10pcs_defs/1 with valid data creates a icd10pcs_defs" do
      assert {:ok, %Icd10pcs_defs{} = icd10pcs_defs} = Codes.create_icd10pcs_defs(@valid_attrs)
      assert icd10pcs_defs.axis_code == "some axis_code"
      assert icd10pcs_defs.axis_title == "some axis_title"
      assert icd10pcs_defs.section == "some section"
      assert icd10pcs_defs.section_title == "some section_title"
      assert icd10pcs_defs.term_definition == "some term_definition"
      assert icd10pcs_defs.term_explanation == "some term_explanation"
      assert icd10pcs_defs.term_includes == "some term_includes"
      assert icd10pcs_defs.term_titles == "some term_titles"
      assert icd10pcs_defs.terms == "some terms"
      assert icd10pcs_defs.title_tsv == "some title_tsv"
    end

    test "create_icd10pcs_defs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_icd10pcs_defs(@invalid_attrs)
    end

    test "update_icd10pcs_defs/2 with valid data updates the icd10pcs_defs" do
      icd10pcs_defs = icd10pcs_defs_fixture()

      assert {:ok, %Icd10pcs_defs{} = icd10pcs_defs} =
               Codes.update_icd10pcs_defs(icd10pcs_defs, @update_attrs)

      assert icd10pcs_defs.axis_code == "some updated axis_code"
      assert icd10pcs_defs.axis_title == "some updated axis_title"
      assert icd10pcs_defs.section == "some updated section"
      assert icd10pcs_defs.section_title == "some updated section_title"
      assert icd10pcs_defs.term_definition == "some updated term_definition"
      assert icd10pcs_defs.term_explanation == "some updated term_explanation"
      assert icd10pcs_defs.term_includes == "some updated term_includes"
      assert icd10pcs_defs.term_titles == "some updated term_titles"
      assert icd10pcs_defs.terms == "some updated terms"
      assert icd10pcs_defs.title_tsv == "some updated title_tsv"
    end

    test "update_icd10pcs_defs/2 with invalid data returns error changeset" do
      icd10pcs_defs = icd10pcs_defs_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Codes.update_icd10pcs_defs(icd10pcs_defs, @invalid_attrs)

      assert icd10pcs_defs == Codes.get_icd10pcs_defs!(icd10pcs_defs.id)
    end

    test "delete_icd10pcs_defs/1 deletes the icd10pcs_defs" do
      icd10pcs_defs = icd10pcs_defs_fixture()
      assert {:ok, %Icd10pcs_defs{}} = Codes.delete_icd10pcs_defs(icd10pcs_defs)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_icd10pcs_defs!(icd10pcs_defs.id) end
    end

    test "change_icd10pcs_defs/1 returns a icd10pcs_defs changeset" do
      icd10pcs_defs = icd10pcs_defs_fixture()
      assert %Ecto.Changeset{} = Codes.change_icd10pcs_defs(icd10pcs_defs)
    end
  end

  describe "ndc_products" do
    alias Icd10cm.Codes.Ndc_product

    @valid_attrs %{ACTIVE_INGRED_UNIT: "some ACTIVE_INGRED_UNIT", ACTIVE_NUMERATOR_STRENGTH: "some ACTIVE_NUMERATOR_STRENGTH", APPLICATIONNUMBER: "some APPLICATIONNUMBER", DEASCHEDULE: "some DEASCHEDULE", DOSAGEFORMNAME: "some DOSAGEFORMNAME", ENDMARKETINGDATE: "some ENDMARKETINGDATE", LABELERNAME: "some LABELERNAME", LISTING_RECORD_CERTIFIED_THROUGH: "some LISTING_RECORD_CERTIFIED_THROUGH", MARKETINGCATEGORYNAME: "some MARKETINGCATEGORYNAME", NDC_EXCLUDE_FLAG: "some NDC_EXCLUDE_FLAG", NONPROPRIETARYNAME: "some NONPROPRIETARYNAME", PHARM_CLASSES: "some PHARM_CLASSES", PRODUCTID: "some PRODUCTID", PRODUCTNDC: "some PRODUCTNDC", PRODUCTTYPENAME: "some PRODUCTTYPENAME", PROPRIETARYNAME: "some PROPRIETARYNAME", PROPRIETARYNAMESUFFIX: "some PROPRIETARYNAMESUFFIX", ROUTENAME: "some ROUTENAME", STARTMARKETINGDATE: "some STARTMARKETINGDATE", SUBSTANCENAME: "some SUBSTANCENAME"}
    @update_attrs %{ACTIVE_INGRED_UNIT: "some updated ACTIVE_INGRED_UNIT", ACTIVE_NUMERATOR_STRENGTH: "some updated ACTIVE_NUMERATOR_STRENGTH", APPLICATIONNUMBER: "some updated APPLICATIONNUMBER", DEASCHEDULE: "some updated DEASCHEDULE", DOSAGEFORMNAME: "some updated DOSAGEFORMNAME", ENDMARKETINGDATE: "some updated ENDMARKETINGDATE", LABELERNAME: "some updated LABELERNAME", LISTING_RECORD_CERTIFIED_THROUGH: "some updated LISTING_RECORD_CERTIFIED_THROUGH", MARKETINGCATEGORYNAME: "some updated MARKETINGCATEGORYNAME", NDC_EXCLUDE_FLAG: "some updated NDC_EXCLUDE_FLAG", NONPROPRIETARYNAME: "some updated NONPROPRIETARYNAME", PHARM_CLASSES: "some updated PHARM_CLASSES", PRODUCTID: "some updated PRODUCTID", PRODUCTNDC: "some updated PRODUCTNDC", PRODUCTTYPENAME: "some updated PRODUCTTYPENAME", PROPRIETARYNAME: "some updated PROPRIETARYNAME", PROPRIETARYNAMESUFFIX: "some updated PROPRIETARYNAMESUFFIX", ROUTENAME: "some updated ROUTENAME", STARTMARKETINGDATE: "some updated STARTMARKETINGDATE", SUBSTANCENAME: "some updated SUBSTANCENAME"}
    @invalid_attrs %{ACTIVE_INGRED_UNIT: nil, ACTIVE_NUMERATOR_STRENGTH: nil, APPLICATIONNUMBER: nil, DEASCHEDULE: nil, DOSAGEFORMNAME: nil, ENDMARKETINGDATE: nil, LABELERNAME: nil, LISTING_RECORD_CERTIFIED_THROUGH: nil, MARKETINGCATEGORYNAME: nil, NDC_EXCLUDE_FLAG: nil, NONPROPRIETARYNAME: nil, PHARM_CLASSES: nil, PRODUCTID: nil, PRODUCTNDC: nil, PRODUCTTYPENAME: nil, PROPRIETARYNAME: nil, PROPRIETARYNAMESUFFIX: nil, ROUTENAME: nil, STARTMARKETINGDATE: nil, SUBSTANCENAME: nil}

    def ndc_product_fixture(attrs \\ %{}) do
      {:ok, ndc_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_ndc_product()

      ndc_product
    end

    test "list_ndc_products/0 returns all ndc_products" do
      ndc_product = ndc_product_fixture()
      assert Codes.list_ndc_products() == [ndc_product]
    end

    test "get_ndc_product!/1 returns the ndc_product with given id" do
      ndc_product = ndc_product_fixture()
      assert Codes.get_ndc_product!(ndc_product.id) == ndc_product
    end

    test "create_ndc_product/1 with valid data creates a ndc_product" do
      assert {:ok, %Ndc_product{} = ndc_product} = Codes.create_ndc_product(@valid_attrs)
      assert ndc_product.ACTIVE_INGRED_UNIT == "some ACTIVE_INGRED_UNIT"
      assert ndc_product.ACTIVE_NUMERATOR_STRENGTH == "some ACTIVE_NUMERATOR_STRENGTH"
      assert ndc_product.APPLICATIONNUMBER == "some APPLICATIONNUMBER"
      assert ndc_product.DEASCHEDULE == "some DEASCHEDULE"
      assert ndc_product.DOSAGEFORMNAME == "some DOSAGEFORMNAME"
      assert ndc_product.ENDMARKETINGDATE == "some ENDMARKETINGDATE"
      assert ndc_product.LABELERNAME == "some LABELERNAME"
      assert ndc_product.LISTING_RECORD_CERTIFIED_THROUGH == "some LISTING_RECORD_CERTIFIED_THROUGH"
      assert ndc_product.MARKETINGCATEGORYNAME == "some MARKETINGCATEGORYNAME"
      assert ndc_product.NDC_EXCLUDE_FLAG == "some NDC_EXCLUDE_FLAG"
      assert ndc_product.NONPROPRIETARYNAME == "some NONPROPRIETARYNAME"
      assert ndc_product.PHARM_CLASSES == "some PHARM_CLASSES"
      assert ndc_product.PRODUCTID == "some PRODUCTID"
      assert ndc_product.PRODUCTNDC == "some PRODUCTNDC"
      assert ndc_product.PRODUCTTYPENAME == "some PRODUCTTYPENAME"
      assert ndc_product.PROPRIETARYNAME == "some PROPRIETARYNAME"
      assert ndc_product.PROPRIETARYNAMESUFFIX == "some PROPRIETARYNAMESUFFIX"
      assert ndc_product.ROUTENAME == "some ROUTENAME"
      assert ndc_product.STARTMARKETINGDATE == "some STARTMARKETINGDATE"
      assert ndc_product.SUBSTANCENAME == "some SUBSTANCENAME"
    end

    test "create_ndc_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_ndc_product(@invalid_attrs)
    end

    test "update_ndc_product/2 with valid data updates the ndc_product" do
      ndc_product = ndc_product_fixture()
      assert {:ok, %Ndc_product{} = ndc_product} = Codes.update_ndc_product(ndc_product, @update_attrs)
      assert ndc_product.ACTIVE_INGRED_UNIT == "some updated ACTIVE_INGRED_UNIT"
      assert ndc_product.ACTIVE_NUMERATOR_STRENGTH == "some updated ACTIVE_NUMERATOR_STRENGTH"
      assert ndc_product.APPLICATIONNUMBER == "some updated APPLICATIONNUMBER"
      assert ndc_product.DEASCHEDULE == "some updated DEASCHEDULE"
      assert ndc_product.DOSAGEFORMNAME == "some updated DOSAGEFORMNAME"
      assert ndc_product.ENDMARKETINGDATE == "some updated ENDMARKETINGDATE"
      assert ndc_product.LABELERNAME == "some updated LABELERNAME"
      assert ndc_product.LISTING_RECORD_CERTIFIED_THROUGH == "some updated LISTING_RECORD_CERTIFIED_THROUGH"
      assert ndc_product.MARKETINGCATEGORYNAME == "some updated MARKETINGCATEGORYNAME"
      assert ndc_product.NDC_EXCLUDE_FLAG == "some updated NDC_EXCLUDE_FLAG"
      assert ndc_product.NONPROPRIETARYNAME == "some updated NONPROPRIETARYNAME"
      assert ndc_product.PHARM_CLASSES == "some updated PHARM_CLASSES"
      assert ndc_product.PRODUCTID == "some updated PRODUCTID"
      assert ndc_product.PRODUCTNDC == "some updated PRODUCTNDC"
      assert ndc_product.PRODUCTTYPENAME == "some updated PRODUCTTYPENAME"
      assert ndc_product.PROPRIETARYNAME == "some updated PROPRIETARYNAME"
      assert ndc_product.PROPRIETARYNAMESUFFIX == "some updated PROPRIETARYNAMESUFFIX"
      assert ndc_product.ROUTENAME == "some updated ROUTENAME"
      assert ndc_product.STARTMARKETINGDATE == "some updated STARTMARKETINGDATE"
      assert ndc_product.SUBSTANCENAME == "some updated SUBSTANCENAME"
    end

    test "update_ndc_product/2 with invalid data returns error changeset" do
      ndc_product = ndc_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Codes.update_ndc_product(ndc_product, @invalid_attrs)
      assert ndc_product == Codes.get_ndc_product!(ndc_product.id)
    end

    test "delete_ndc_product/1 deletes the ndc_product" do
      ndc_product = ndc_product_fixture()
      assert {:ok, %Ndc_product{}} = Codes.delete_ndc_product(ndc_product)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_ndc_product!(ndc_product.id) end
    end

    test "change_ndc_product/1 returns a ndc_product changeset" do
      ndc_product = ndc_product_fixture()
      assert %Ecto.Changeset{} = Codes.change_ndc_product(ndc_product)
    end
  end

  describe "ndc_packages" do
    alias Icd10cm.Codes.Ndc_package

    @valid_attrs %{endmarketingdate: "some endmarketingdate", ndc_exclude_flag: "some ndc_exclude_flag", ndcpackagecode: "some ndcpackagecode", packagedescription: "some packagedescription", productid: "some productid", productndc: "some productndc", sample_package: "some sample_package", startmarketingdate: "some startmarketingdate"}
    @update_attrs %{endmarketingdate: "some updated endmarketingdate", ndc_exclude_flag: "some updated ndc_exclude_flag", ndcpackagecode: "some updated ndcpackagecode", packagedescription: "some updated packagedescription", productid: "some updated productid", productndc: "some updated productndc", sample_package: "some updated sample_package", startmarketingdate: "some updated startmarketingdate"}
    @invalid_attrs %{endmarketingdate: nil, ndc_exclude_flag: nil, ndcpackagecode: nil, packagedescription: nil, productid: nil, productndc: nil, sample_package: nil, startmarketingdate: nil}

    def ndc_package_fixture(attrs \\ %{}) do
      {:ok, ndc_package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_ndc_package()

      ndc_package
    end

    test "list_ndc_packages/0 returns all ndc_packages" do
      ndc_package = ndc_package_fixture()
      assert Codes.list_ndc_packages() == [ndc_package]
    end

    test "get_ndc_package!/1 returns the ndc_package with given id" do
      ndc_package = ndc_package_fixture()
      assert Codes.get_ndc_package!(ndc_package.id) == ndc_package
    end

    test "create_ndc_package/1 with valid data creates a ndc_package" do
      assert {:ok, %Ndc_package{} = ndc_package} = Codes.create_ndc_package(@valid_attrs)
      assert ndc_package.endmarketingdate == "some endmarketingdate"
      assert ndc_package.ndc_exclude_flag == "some ndc_exclude_flag"
      assert ndc_package.ndcpackagecode == "some ndcpackagecode"
      assert ndc_package.packagedescription == "some packagedescription"
      assert ndc_package.productid == "some productid"
      assert ndc_package.productndc == "some productndc"
      assert ndc_package.sample_package == "some sample_package"
      assert ndc_package.startmarketingdate == "some startmarketingdate"
    end

    test "create_ndc_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_ndc_package(@invalid_attrs)
    end

    test "update_ndc_package/2 with valid data updates the ndc_package" do
      ndc_package = ndc_package_fixture()
      assert {:ok, %Ndc_package{} = ndc_package} = Codes.update_ndc_package(ndc_package, @update_attrs)
      assert ndc_package.endmarketingdate == "some updated endmarketingdate"
      assert ndc_package.ndc_exclude_flag == "some updated ndc_exclude_flag"
      assert ndc_package.ndcpackagecode == "some updated ndcpackagecode"
      assert ndc_package.packagedescription == "some updated packagedescription"
      assert ndc_package.productid == "some updated productid"
      assert ndc_package.productndc == "some updated productndc"
      assert ndc_package.sample_package == "some updated sample_package"
      assert ndc_package.startmarketingdate == "some updated startmarketingdate"
    end

    test "update_ndc_package/2 with invalid data returns error changeset" do
      ndc_package = ndc_package_fixture()
      assert {:error, %Ecto.Changeset{}} = Codes.update_ndc_package(ndc_package, @invalid_attrs)
      assert ndc_package == Codes.get_ndc_package!(ndc_package.id)
    end

    test "delete_ndc_package/1 deletes the ndc_package" do
      ndc_package = ndc_package_fixture()
      assert {:ok, %Ndc_package{}} = Codes.delete_ndc_package(ndc_package)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_ndc_package!(ndc_package.id) end
    end

    test "change_ndc_package/1 returns a ndc_package changeset" do
      ndc_package = ndc_package_fixture()
      assert %Ecto.Changeset{} = Codes.change_ndc_package(ndc_package)
    end
  end
end
