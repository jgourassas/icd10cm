defmodule Icd10cm.Codes.Icd10cm_eindex do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10cm_eindexes" do
    field :main_term_jsonb, :map
    field :main_term_text, :string
    field :title, :string
    field :title_tsv, :string
  end

  @doc false
  def changeset(icd10cm_eindex, attrs) do
    icd10cm_eindex
    |> cast(attrs, [:title, :main_term_text, :main_term_jsonb, :title_tsv])
    |> validate_required([])

    #|> validate_required([:title, :main_term_text, :main_term_jsonb, :title_tsv])
  end
end
