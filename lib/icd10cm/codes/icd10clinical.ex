defmodule Icd10cm.Codes.Icd10clinical do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10clinicals" do
    field :chapter_description, :string
    field :chapter_name, :integer
    field :codealso, :string
    field :codefirst, :string
    field :excludes1, :string
    field :excludes2, :string
    field :icd10cm_code, :string
    field :icd10cm_code_2, :string
    field :icd10cm_code_2_ltree, :string
    field :icd10cm_code_ltree, :string
    field :includes, :string
    field :inclusionterm, :string
    field :is_category, :string
    field :is_header, :string
    field :is_subcategory, :string
    field :long_description, :string
    field :order_number, :integer
    field :section_description, :string
    field :section_id, :string
    field :short_description, :string
    field :useadditionalcode, :string

    # timestamps()
  end

  @doc false
  def changeset(icd10clinical, attrs) do
    icd10clinical
    |> cast(attrs, [
      :order_number,
      :icd10cm_code,
      :icd10cm_code_2,
      :icd10cm_code_2_ltree,
      :is_header,
      :short_description,
      :long_description,
      :includes,
      :inclusionterm,
      :excludes1,
      :excludes2,
      :codefirst,
      :codealso,
      :useadditionalcode,
      :chapter_name,
      :chapter_description,
      :section_id,
      :section_description,
      :is_category,
      :is_subcategory,
      :icd10cm_code_ltree
    ])
    |> validate_required([])

    # |> validate_required([
    #  :order_number,
    #  :icd10cm_code,
    #  :icd10cm_code_2,
    #  :icd10cm_code_2_ltree,
    #  :is_header,
    #  :short_description,
    #  :long_description,
    #  :includes,
    #  :inclusionterm,
    #  :excludes1,
    #  :excludes2,
    #  :codefirst,
    #  :codealso,
    #  :useadditionalcode,
    #  :chapter_name,
    #  :chapter_description,
    #  :section_id,
    #  :section_description,
    #  :is_category,
    #  :is_subcategory,
    #  :icd10cm_code_ltree
    # ])
  end
end
