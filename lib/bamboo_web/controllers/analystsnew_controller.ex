defmodule BambooWeb.AnalystsnewController do
  use BambooWeb, :controller

  alias Bamboo.Analystsnews
  alias Bamboo.Analystsnews.Analystsnew

  action_fallback BambooWeb.FallbackController

  def index(conn, _params) do
    [analystsnews] = Analystsnews.list_analystsnews()
    render(conn, "index.json", analystsnews: analystsnews)
  end

  def create(conn, %{"analystsnew" => analystsnew_params}) do
    with {:ok, %Analystsnew{} = analystsnew} <-
           Analystsnews.create_analystsnew(analystsnew_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.analystsnew_path(conn, :show, analystsnew))
      |> render("show.json", analystsnew: analystsnew)
    end
  end

  def show(conn, %{"id" => id}) do
    analystsnew = Analystsnews.get_analystsnew!(id)
    render(conn, "show.json", analystsnew: analystsnew)
  end


end
