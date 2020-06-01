defmodule Icd10cm.Repo.Migrations.CreateIcd10cmDindexes do
  use Ecto.Migration

  def change do
    create table(:icd10cm_dindexes) do
      add :title, :string
      add :main_term, :map
      add :title_tsv, :tsvector

    end

  end
end
