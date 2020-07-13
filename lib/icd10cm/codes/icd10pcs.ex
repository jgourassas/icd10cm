defmodule Icd10cm.Codes.Icd10pcs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10_pcses" do
    field :approach, :string
    field :approach_title, :string
    field :body_part, :string
    field :body_part_title, :string
    field :body_system, :string
    field :body_system_title, :string
    field :device, :string
    field :device_title, :string
    field :icd10pcs_code, :string
    field :icd10pcs_code_2, :string
    field :icd10pcs_code_2_ltree, :string
    field :icd10pcs_code_ltree, :string
    field :is_header, :string
    field :long_description, :string
    field :order_number, :integer
    field :qualifier, :string
    field :qualifier_title, :string
    field :root_operation, :string
    field :root_operation_title, :string
    field :section, :string
    field :section_title, :string
    field :short_description, :string
  end

  @doc false
  def changeset(icd10pcs, attrs) do
    icd10pcs
    |> cast(attrs, [
      :order_number,
      :icd10pcs_code,
      :icd10pcs_code_2,
      :icd10pcs_code_2_ltree,
      :is_header,
      :short_description,
      :long_description,
      :section,
      :section_title,
      :body_system,
      :body_system_title,
      :root_operation,
      :root_operation_title,
      :body_part,
      :body_part_title,
      :approach,
      :approach_title,
      :device,
      :device_title,
      :qualifier,
      :qualifier_title,
      :icd10pcs_code_ltree
    ])
    |> validate_required([])

    # |> validate_required([:order_number, :icd10pcs_code, :icd10pcs_code_2, :icd10pcs_code_2_ltree, :is_header, :short_description, :long_description, :section, :section_title, :body_system, :body_system_title, :root_operation, :root_operation_title, :body_part, :body_part_title, :approach, :approach_title, :device, :device_title, :qualifier, :qualifier_title, :icd10pcs_code_ltree])
  end
end
