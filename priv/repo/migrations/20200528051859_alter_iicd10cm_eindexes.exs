defmodule Icd10cm.Repo.Migrations.AlterIicd10cmEindexes do
  use Ecto.Migration

  def change do
    rename table(:iicd10cm_eindexes), to: table(:icd10cm_eindexes)
  end
end
