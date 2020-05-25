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
end
