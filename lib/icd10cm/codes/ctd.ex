defmodule Icd10cm.Codes.Ctd do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ctds" do
    field :altdiseaseids, :string
    field :definition, :string
    field :diseaseid, :string
    field :diseasename, :string
    field :parentids, :string
    field :parenttreenumbers, :string
    field :slimmappings, :string
    field :synonyms, :string
    field :treenumbers, :string

  end

  @doc false
  def changeset(ctd, attrs) do
    ctd
    |> cast(attrs, [:diseasename, :diseaseid, :altdiseaseids, :definition, :parentids, :treenumbers, :parenttreenumbers, :synonyms, :slimmappings])
    |> validate_required([])

    #|> validate_required([:diseasename, :diseaseid, :altdiseaseids, :definition, :parentids, :treenumbers, :parenttreenumbers, :synonyms, :slimmappings])
  end
end
