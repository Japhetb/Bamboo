defmodule BambooWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
   otp_app: :bamboo,
    module: BambooWeb.Auth.Guardian,
    error_handler: BambooWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource

end
