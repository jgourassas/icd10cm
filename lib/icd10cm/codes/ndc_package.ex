defmodule Icd10cm.Codes.Ndc_package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ndc_packages" do
    field :endmarketingdate, :string
    field :ndc_exclude_flag, :string
    field :ndcpackagecode, :string
    field :packagedescription, :string
    field :productid, :string
    field :productndc, :string
    field :sample_package, :string
    field :startmarketingdate, :string
    #field :ndc_pruduct_id, :integer


 
    #timestamps()
  end

  @doc false
  def changeset(ndc_package, attrs) do
    ndc_package
    |> cast(attrs, [:productid,
    :productndc,
    :ndcpackagecode,
    :packagedescription,
    :startmarketingdate,
    :endmarketingdate,
    :ndc_exclude_flag,
   # :ndc_pruduct_id,
    :sample_package])
    #|> validate_required([:productid, :productndc, :ndcpackagecode, :packagedescription, :startmarketingdate, :endmarketingdate, :ndc_exclude_flag, :sample_package])
  end
end
