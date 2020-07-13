defmodule Icd10cm.Repo.Migrations.AlterTableIcd10pcsDefs do
  use Ecto.Migration

  def change do
    alter table(:icd10pcs_defs) do
      remove :terms
      add :terms, :map
      remove :inserted_at
      remove :updated_at
    end
  end
end
