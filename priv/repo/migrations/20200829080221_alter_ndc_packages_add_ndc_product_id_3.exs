defmodule Icd10cm.Repo.Migrations.AlterNdcPackagesAddNdcProductId3 do
  use Ecto.Migration

  def change do
    alter table(:ndc_packages) do
      remove :ndc_product_id

      # :productndc, references(:ndc_products, on_delete: :delete_all)
    end
  end
end
