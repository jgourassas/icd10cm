defmodule Icd10cm.Codes.Ndc_product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ndc_products" do
    field :productid, :string
      field :productndc, :string
      field :producttypename, :string
      field :proprietaryname, :string
      field :proprietarynamesuffix, :string
      field :nonproprietaryname, :string
      field :dosageforname, :string
      field :routename, :string
      field :startmarketingdate, :string
      field :endmargetingdate, :string
      field :marketingcategoryname, :string
      field :applicationnumber, :string
      field :labelname, :string
      field :substancename, :string
      field :active_numerator_strength, :string
      field :active_ingred_unit, :string
      field :pharm_classes, :string
      field :deaschedule, :string
      field :ndc_exlude_flag, :string
      field :listing_record_certified_through, :string

      has_many(
        :ndc_packages,
        Icd10cm.Codes.Ndc_package,
        #foreign_key: :ndc_product_id
        foreign_key: :productndc
      )


    #timestamps()
  end

  @doc false
  def changeset(ndc_product, attrs) do
    ndc_product
    #|> cast(attrs, [:PRODUCTID, :PRODUCTNDC, :PRODUCTTYPENAME, :PROPRIETARYNAME, :PROPRIETARYNAMESUFFIX, :NONPROPRIETARYNAME, :DOSAGEFORMNAME, :ROUTENAME, :STARTMARKETINGDATE, :ENDMARKETINGDATE, :MARKETINGCATEGORYNAME, :APPLICATIONNUMBER, :LABELERNAME, :SUBSTANCENAME, :ACTIVE_NUMERATOR_STRENGTH, :ACTIVE_INGRED_UNIT, :PHARM_CLASSES, :DEASCHEDULE, :NDC_EXCLUDE_FLAG, :LISTING_RECORD_CERTIFIED_THROUGH])
    |> cast(attrs, [
      :productid,
      :productndc,
      :producttypename,
       :proprietaryname,
       :proprietarynamesuffix,
       :nonproprietaryname,
       :dosageforname,
       :routename,
       :startmarketingdate,
       :endmargetingdate,
       :marketingcategoryname,
       :applicationnumber,
       :labelname,
       :substancename,
       :active_numerator_strength,
       :active_ingred_unit,
       :pharm_classes,
       :deaschedule,
       :ndc_exlude_flag,
       :listing_record_certified_through,

    ]

    )
    #|> validate_required([:PRODUCTID, :PRODUCTNDC, :PRODUCTTYPENAME, :PROPRIETARYNAME, :PROPRIETARYNAMESUFFIX, :NONPROPRIETARYNAME, :DOSAGEFORMNAME, :ROUTENAME, :STARTMARKETINGDATE, :ENDMARKETINGDATE, :MARKETINGCATEGORYNAME, :APPLICATIONNUMBER, :LABELERNAME, :SUBSTANCENAME, :ACTIVE_NUMERATOR_STRENGTH, :ACTIVE_INGRED_UNIT, :PHARM_CLASSES, :DEASCHEDULE, :NDC_EXCLUDE_FLAG, :LISTING_RECORD_CERTIFIED_THROUGH])
  end
end
