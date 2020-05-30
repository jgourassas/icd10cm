defmodule Icd10cm.Repo.Migrations.AlterTableIcd10cmOrdersAddTsvectors do
  use Ecto.Migration

  def change do
    alter table(:icd10cm_orders) do
      add :long_description_tsv, :tsvector
      add :short_description_tsv, :tsvector
    end

    execute """
              UPDATE icd10cm_orders
              SET long_description_tsv = CAST(to_tsvector('english',long_description) AS tsvector);
            """


    execute """
              CREATE INDEX icd10cm_long_description_tsv_idx on icd10cm_orders
              USING gin (to_tsvector('english'::regconfig, long_description_tsv::text));
            """

  end
end
