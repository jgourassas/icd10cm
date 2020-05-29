defmodule Icd10cm.Repo.Migrations.EindexesremoveTimestamps do
  use Ecto.Migration

  def change do
alter table(:icd10cm_eindexes) do
    remove :inserted_at
    remove :updated_at
    end
  end
end
