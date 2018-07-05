defmodule PushServer.VoiceController do
  use PushServer.Web, :controller

  def index(conn, params) do
    %{
      "token" => token,
      "text" => text
    } = params
    
    if token == "4sdlXBNV2mdGmGKqjxzuEPna" do
      msg = %{ "body" => text }
      registration_id = "cvuQvZlGhD0:APA91bFyja1zaABnsTlRx56DGc0aK8p0PMEe6u9lxu8s17RSCq1T-WeYSytgAWNkCXNPD9fvz__aPDmnq_1O1VzK_Hcxa_0xPt79T2GKuws2IjCLkK5YGSZhaoIbg3h-cRqe9yAXgkhstsf9bJhkS-3vzN-7p49qoA"
      n = Pigeon.FCM.Notification.new(registration_id, msg)
      Pigeon.FCM.push(n)
    else
      json conn, %{"text": "invalid token"}
    end
  end
end
