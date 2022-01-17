defmodule BambooWeb.AnalystsnewView do
  use BambooWeb, :view

  def render("index.json", %{analystsnews: analystsnews}) do
    %{
      id: analystsnews.id,
      author: analystsnews.author,
      title: analystsnews.title,
      source_url: analystsnews.source_url,
      content: analystsnews.content
    }
  end
end
