defmodule BambooWeb.ExternalNewView do
  use BambooWeb, :view


  def render("user.json", %{news: news}) do
    for x <- news do
      %{
        author: x.author,
        content: x.content,
        description: x.description,
        publishedAt: x.publishedAt,
        source: x.source,
        title: x.title,
        url: x.url,
        urlToImage: x.urlToImage
      }
    end


  end
end
