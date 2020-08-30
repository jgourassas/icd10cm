defmodule Icd10cm.Repo.Migrations.AlterNdcPackagesAddNdcProductId do
  use Ecto.Migration

  def change do
 alter table(:ndc_packages) do
   add :ndc_product_id, :bigint
end

  end
end
