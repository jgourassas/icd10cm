defmodule Icd10cm.Codes.Icd10cm_order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10cm_orders" do
    field :icd10cm_code, :string
    field :icd10cm_code_2, :string
    field :is_header, :string
    field :order_number, :integer
    field :short_description, :string
    field(:long_description, :string)
  end

  @doc false
  def changeset(icd10cm_order, attrs) do
    icd10cm_order
    |> cast(attrs, [
      :order_number,
      :icd10cm_code,
      :icd10cm_code_2,
      :is_header,
      :short_description,
      :long_description
    ])
    |> validate_required([])

    # |> validate_required([:order_number, :icd10cm_code, :is_header, :short_description, :" "])
  end
end
