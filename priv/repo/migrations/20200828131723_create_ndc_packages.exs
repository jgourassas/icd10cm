defmodule Icd10cm.Repo.Migrations.CreateNdcPackages do
  use Ecto.Migration

  def change do
    create table(:ndc_packages) do
      add :productid, :text
      add :productndc, :text
      add :ndcpackagecode, :text
      add :packagedescription, :text
      add :startmarketingdate, :text
      add :endmarketingdate, :text
      add :ndc_exclude_flag, :text
      add :sample_package, :text

      timestamps()
    end
  end
end
