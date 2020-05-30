defmodule Icd10cm.Repo.Migrations.CreateIcd10cmNeoplasms do
  use Ecto.Migration

  def change do
    create table(:icd10cm_neoplasms) do
      add :title, :string
      add :main_term, :map
      add :title_tsv, :tsvector
    end
  end
end
