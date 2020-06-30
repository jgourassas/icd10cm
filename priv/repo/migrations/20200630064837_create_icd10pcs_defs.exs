defmodule Icd10cm.Repo.Migrations.CreateIcd10pcsDefs do
  use Ecto.Migration

  def change do
    create table(:icd10pcs_defs) do
      add :section, :string, size: 1
      add :section_title, :string, size: 100
      add :axis_code, :string, size: 1
      add :axis_title, :string
      add :terms, {:array, :map}
      add :title_tsv, :tsvector
      add :term_definition, :text
      add :term_explanation, :text
      add :term_titles, :text
      add :term_includes, :text

      timestamps()
    end

  end
end
