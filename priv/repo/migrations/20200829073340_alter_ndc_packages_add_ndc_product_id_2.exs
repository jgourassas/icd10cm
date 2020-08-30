defmodule Icd10cm.Repo.Migrations.AlterNdcPackagesAddNdcProductId2 do
  use Ecto.Migration

  def change do
   alter table(:ndc_packages ) do
    remove :ndc_product_id
    add(:ndc_product_id, references(:ndc_products, on_delete: :delete_all))

  end

  end
end
