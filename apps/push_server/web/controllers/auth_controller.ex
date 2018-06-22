defmodule PushServer.AuthController do
  use PushServer.Web, :controller
  plug Ueberauth

  # alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    json conn, "Facebook login required"
  end

  def delete(conn, _params) do
    json conn, "You have been logged out!"
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    json conn, "Failed to authenticate."
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case PushServer.User.find_or_create(auth) do
      {:ok, user} -> json conn, user
      {:error, reason} -> json conn, reason
    end
  end
end
