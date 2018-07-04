defmodule PushServer.VoiceController do
  use PushServer.Web, :controller

  def index(conn, params) do
    %{
      "token" => token,
      "text" => text
    } = params
    
    if token == "4sdlXBNV2mdGmGKqjxzuEPna" do
      msg = %{ "body" => text }
      registration_id = "f2pEx--WRQs:APA91bHPQdu7w2YhaU31Nrx0RnNeOUfPAE9xNjzTDlWtpdjEy4SroF0tR1Q94ttxXlA3yVceEVDGeCvCznkO8rrVuiM6Cz9wM_9EyMe8CbeAdHiPZ6jlrJ_y9iKYQkuGbr9kVVZKIkS6jv7_lCwbCy0m5Q7X1j2qnQ"
      n = Pigeon.FCM.Notification.new(registration_id, msg)
      Pigeon.FCM.push(n)
    else
      json conn, %{"text": "invalid token"}
    end
  end
end
