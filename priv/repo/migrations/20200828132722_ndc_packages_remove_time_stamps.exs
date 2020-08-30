defmodule Icd10cm.Repo.Migrations.NdcPackagesRemoveTimeStamps do
  use Ecto.Migration

  def change do
    alter table(:ndc_packages) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
