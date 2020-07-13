defmodule Icd10cm.Repo.Migrations.CreateCtds do
  use Ecto.Migration

  def change do
    create table(:ctds) do
      add :diseasename, :string
      add :diseaseid, :string
      add :altdiseaseids, :string
      add :definition, :text
      add :parentids, :string
      add :treenumbers, :text
      add :parenttreenumbers, :text
      add :synonyms, :text
      add :slimmappings, :text
    end
  end
end
