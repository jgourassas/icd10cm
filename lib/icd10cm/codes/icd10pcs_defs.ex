defmodule Icd10cm.Codes.Icd10pcs_defs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "icd10pcs_defs" do
    field :axis_code, :string
    field :axis_title, :string
    field :section, :string
    field :section_title, :string
    field :term_definition, :string
    field :term_explanation, :string
    field :term_includes, :string
    field :term_titles, :string
    #field :terms, :string
    field :terms, :map
    field :title_tsv, :string

    end

  @doc false
  def changeset(icd10pcs_defs, attrs) do
    icd10pcs_defs
    |> cast(attrs, [:section, :section_title, :axis_code, :axis_title, :terms, :title_tsv, :term_definition, :term_explanation, :term_titles, :term_includes])
    #|> validate_required([:section, :section_title, :axis_code, :axis_title, :terms, :title_tsv, :term_definition, :term_explanation, :term_titles, :term_includes])
    |> validate_required([])
  end
end
