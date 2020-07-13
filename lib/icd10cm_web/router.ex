defmodule Icd10cmWeb.Router do
  use Icd10cmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Icd10cmWeb do
    pipe_through :browser

    get("/", PageController, :index)

    get "/page", PageController, :index, as: :pages

    post("/icd10clinicals/search_clinicals", Icd10clinicalController, :search_clinicals)
    resources("/icd10clinicals", Icd10clinicalController)
    resources("/icd10cm_neoplasms", Icd10cm_neoplasmController)
    post("/icd10cm_neoplasms/search_neoplasms", Icd10cm_neoplasmController, :search_neoplasms)
    resources("/icd10cm_eindexes", Icd10cm_eindexController)
    post("/icd10cm_eindexes/search_eindexes", Icd10cm_eindexController, :search_eindexes)
    resources("/icd10cm_orders", Icd10cm_orderController)
    post("/icd10cm_orders/search_orders", Icd10cm_orderController, :search_orders)
    resources("/ctds", CtdController)
    post("/ctds/search_ctds", CtdController, :search_ctds)
    resources("/icd10cm_dindexes", Icd10cm_dindexController)
    post("/icd10cm_dindexes/search_dindexes", Icd10cm_dindexController, :search_dindexes)
    resources("/icd10_pcses", Icd10pcsController, as: :pcs)
    post("/icd10_pcses/search_pcs", Icd10pcsController, :search_pcs)
    resources("/icd10pcs_defs", Icd10pcs_defsController, as: :pcs_defs)
    post("/icd10pcs_defs/search_pcs_defs", Icd10pcs_defsController, :search_pcs_defs)
    resources("/Icd10cm_tree", Icd10cm_treeController, as: :icd10cm_tree)

    post(
      "/icd10cm_tree/get_icd10cm_clinicals_json",
      Icd10cm_treeController,
      :get_icd10cm_clinicals_json
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", Icd10cmWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: Icd10cmWeb.Telemetry
    end
  end
end
