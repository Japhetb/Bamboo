defmodule Bamboo.ExternalApiNews do
  @base "https://newsapi.org/v2/everything?q=tesla&from=2021-12-02&sortBy=publishedAt&apiKey=d36aa080b28741ffaace9996dc48c07d"

  def fetch_blog() do
    {:ok, %{ "articles" =>  articles,  "status" => _status,"totalResults" => _result}} = fetch_json( @base )
    articles = articles |> Enum.map(fn x -> to_atoms(x) end) |> Enum.take(size_limit())
    articles
  end

  defp fetch_json(pair) do
    case HTTPoison.get(pair) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body) }
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found }
      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason }
    end
  end

  defp to_atoms(
    %{
      "author" => author,
      "content" => content,
      "description" => description,
      "publishedAt" => date,
      "source" => source,
      "title" => title,
      "url" => url,
      "urlToImage" => image
    }

  ) do

    %{
      author: author,
      content: content,
      description: description,
      publishedAt: date,
      source: source["name"],
      title: title,
      url: url,
      urlToImage: image
    }
  end

  defp size_limit(payload \\ 100) do
    case payload do
    {:ok, android} -> 10
    {:ok, ios} -> 20
    _ -> 100
    end
  end





end
