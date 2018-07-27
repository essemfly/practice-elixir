defmodule Gostop.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :gostop,
    error_handler: Gostop.Auth.ErrorHandler,
    module: Gostop.Auth.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}

  plug Guardian.Plug.LoadResource, allow_blank: true
end
