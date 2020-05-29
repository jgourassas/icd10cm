defmodule Icd10cm.Repo.Migrations.CreateIicd10cmEindexes do
  use Ecto.Migration

  def change do
    create table(:iicd10cm_eindexes) do
      add :title, :string
      add :main_term_text, :text
      add :main_term_jsonb, :map
      add :title_tsv, :string

      timestamps()
    end

  end
end
