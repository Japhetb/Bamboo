defmodule BambooWeb.AnalystsnewView do
  use BambooWeb, :view
  alias BambooWeb.AnalystsnewView

  def render("analystsnew.json", %{analystsnew: analystsnew}) do
    %{
      id: analystsnew.id,
      author: analystsnew.author,
      title: analystsnew.title,
      source_url: analystsnew.source_url,
      content: analystsnew.content
    }
  end
end
