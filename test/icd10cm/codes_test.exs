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
end
