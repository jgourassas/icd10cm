defmodule Icd10cm.Repo.Migrations.CreateIcd10clinicals do
  use Ecto.Migration

  def change do
    create table(:icd10clinicals) do
      add :order_number, :integer
      add :icd10cm_code, :string
      add :icd10cm_code_2, :string
      add :icd10cm_code_2_ltree, :string
      add :is_header, :string
      add :short_description, :string
      add :long_description, :string
      add :includes, :text
      add :inclusionterm, :text
      add :excludes1, :text
      add :excludes2, :text
      add :codefirst, :text
      add :codealso, :text
      add :useadditionalcode, :text
      add :chapter_name, :integer
      add :chapter_description, :text
      add :section_id, :string
      add :section_description, :text
      add :is_category, :string
      add :is_subcategory, :string
      add :icd10cm_code_ltree, :string
      add :long_description_tsv, :tsvector
    end
  end
end
