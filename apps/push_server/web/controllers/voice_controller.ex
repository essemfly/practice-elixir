defmodule PushServer.VoiceController do
  use PushServer.Web, :controller

  def index(conn, params) do
    %{
      "token" => token,
      "text" => text
    } = params
    
    if token == "4sdlXBNV2mdGmGKqjxzuEPna" do
      CoinSearcher.send_telegram_msg(text)
      json conn, %{"text": text}
    else
      json conn, %{"text": "invalid token"}
    end
  end
end
