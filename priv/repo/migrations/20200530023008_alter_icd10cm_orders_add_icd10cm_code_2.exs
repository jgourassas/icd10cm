defmodule Icd10cm.Repo.Migrations.AlterIcd10cmOrdersAddIcd10cmCode2 do
  use Ecto.Migration

  def change do
    alter table(:icd10cm_orders) do
      add :icd10cm_code_2, :string, size: 9
    end
  end
end
