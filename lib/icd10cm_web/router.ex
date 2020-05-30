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
    # get "/page", PageController, :index, as: :pages

    post("/icd10clinicals/search_clinicals", Icd10clinicalController, :search_clinicals)
    resources("/icd10clinicals", Icd10clinicalController)
    resources("/icd10cm_neoplasms", Icd10cm_neoplasmController)
    post("/icd10cm_neoplasms/search_neoplasms", Icd10cm_neoplasmController, :search_neoplasms)
    resources("/icd10cm_eindexes", Icd10cm_eindexController)
    resources("/icd10cm_orders", Icd10cm_orderController)
    post("/icd10cm_orders/search_orders", Icd10cm_orderController, :search_orders)


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
