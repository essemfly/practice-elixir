defmodule GostopWeb.LoungeController do
  use GostopWeb, :controller

  def index(conn, _params) do
    conn |> render("index.html")
  end
end
