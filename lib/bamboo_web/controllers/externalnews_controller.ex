defmodule BambooWeb.ExternalNewController do
  use BambooWeb, :controller

  alias Bamboo.ExternalApiNews


  def index(conn, _params) do
    news = ExternalApiNews.fetch_news()
    render(conn, "user.json",  %{news:  news})
    end


end
