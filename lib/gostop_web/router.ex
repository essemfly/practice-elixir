defmodule GostopWeb.Router do
  use GostopWeb, :router

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

  pipeline :auth do
    plug Gostop.Auth.Pipeline
  end
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end
  # Maybe logged in scope
  scope "/", GostopWeb do
    pipe_through [:browser, :auth]
    get "/", LoginController, :index
    post "/", LoginController, :login
    post "/logout", LoginController, :logout
  end
  # Definitely logged in scope
  scope "/", GostopWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    get "/main", LoginController, :main
  end

  # Other scopes may use custom stacks.
  # scope "/api", GostopWeb do
  #   pipe_through :api
  # end
end
