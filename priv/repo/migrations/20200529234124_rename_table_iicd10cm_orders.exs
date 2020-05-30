defmodule Icd10cm.Repo.Migrations.RenameTableIicd10cmOrders do
  use Ecto.Migration

  def change do
    rename table(:iicd10cm_orders), to: table(:icd10cm_orders)
  end
end
