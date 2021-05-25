defmodule Icd10cm.Repo.Migrations.CreateNdcProducts do
  use Ecto.Migration

  def change do
    create table(:ndc_products) do
      add :productid, :text
      add :productndc, :text
      add :producttypename, :text
      add :proprietaryname, :text
      add :proprietarynamesuffix, :text
      add :nonproprietaryname, :text
      add :dosageforname, :text
      add :routename, :text
      add :startmarketingdate, :text
      add :endmargetingdate, :text
      add :marketingcategoryname, :text
      add :applicationnumber, :text
      add :labelname, :text
      add :substancename, :text
      add :active_numerator_strength, :text
      add :active_ingred_unit, :text
      add :pharm_classes, :text
      add :deaschedule, :text
      add :ndc_exlude_flag, :text
      add :listing_record_certified_through, :text

      # timestamps()
    end
  end
end
