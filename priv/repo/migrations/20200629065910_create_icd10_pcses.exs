defmodule Icd10cm.Repo.Migrations.CreateIcd10Pcses do
  use Ecto.Migration

  def change do
    create table(:icd10_pcses) do
      add :order_number, :integer
      add :icd10pcs_code, :string
      add :icd10pcs_code_2, :string
      add :icd10pcs_code_2_ltree, :string
      add :is_header, :string
      add :short_description, :string
      add :long_description, :string
      add :section, :string
      add :section_title, :string
      add :body_system, :string
      add :body_system_title, :string
      add :root_operation, :string
      add :root_operation_title, :string
      add :body_part, :string
      add :body_part_title, :string
      add :approach, :string
      add :approach_title, :string
      add :device, :string
      add :device_title, :string
      add :qualifier, :string
      add :qualifier_title, :string
      add :icd10pcs_code_ltree, :string
    end
  end
end
