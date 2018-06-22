defmodule PushServer.AuthController do
  use PushServer.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def delete(conn, _params) do
    conn |> json "You have been logged out!"
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn |> json "Failed to authenticate."
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case PushServer.User.find_or_create(auth) do
      {:ok, user} ->
        conn |> json user
      {:error, reason} ->
        conn |> json reason
    end
  end
end
