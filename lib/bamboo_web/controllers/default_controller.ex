defmodule BambooWeb.DefaultController do
  use BambooWeb, :controller

  def index(conn, _params) do
    text(conn, "Analysts News !")
  end
end
