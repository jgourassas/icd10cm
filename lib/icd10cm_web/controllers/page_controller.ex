defmodule Icd10cmWeb.PageController do
  use Icd10cmWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
