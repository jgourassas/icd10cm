defmodule Icd10cmWeb.Icd10cm_treeController do
  use Icd10cmWeb, :controller
  alias Icd10cm.Codes

  def index(conn, params) do
    # info_coronary_id = params["info_coronary_id"]

    render(conn, "index.html")
  end

  ##########################
  def get_icd10cm_clinicals_json(conn, %{"input" => input}) do
    results =  Icd10cm.Codes.get_json('data/icd10cm_clinicals.json')
    #results = Icd10cm.Codes.get_json('data/icd10cm_2013.json')
    text(conn, results)
  end

  ##########################
end
