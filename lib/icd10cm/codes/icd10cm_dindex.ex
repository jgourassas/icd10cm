defmodule Icd10cm.Codes.Icd10cm_dindex do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10cm_dindexes" do
    field :main_term, :map
    field :title, :string
    field :title_tsv, :string
  end

  @doc false
  def changeset(icd10cm_dindex, attrs) do
    icd10cm_dindex
    |> cast(attrs, [:title, :main_term, :title_tsv])
    # |> validate_required([:title, :main_term, :title_tsv])
    |> validate_required([])
  end
end
