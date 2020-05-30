defmodule Icd10cm.Codes.Icd10cm_neoplasm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10cm_neoplasms" do
    field :main_term, :map
    field :title, :string
    field :title_tsv, :string
  end

  @doc false
  def changeset(icd10cm_neoplasm, attrs) do
    icd10cm_neoplasm
    |> cast(attrs, [:title, :main_term, :title_tsv])
    |> validate_required([])

    # |> validate_required([:title, :main_term, :title_tsv])
  end
end
