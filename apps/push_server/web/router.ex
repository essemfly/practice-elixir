defmodule PushServer.Router do
  use PushServer.Web, :router

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

  scope "/", PushServer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", PushServer do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/voice", PushServer do
    post "/", VoiceController, :index
  end
end
