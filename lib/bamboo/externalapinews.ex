defmodule Bamboo.ExternalApiNews do
  @base "https://newsapi.org/v2/everything?q=tesla&from=#{Date.utc_today().year}-#{Date.utc_today().month}-0#{Date.utc_today().day}&sortBy=publishedAt&apiKey=d36aa080b28741ffaace9996dc48c07d"

  alias Bamboo.Counter
  alias Bamboo.Limits, as: Limits

  def fetch_news() do
    {:ok, %{"articles" => articles, "status" => _status, "totalResults" => _result}} =
      fetch_json(@base)

    articles = articles |> Enum.map(fn x -> to_atoms(x) end) |> Enum.take(size_limit())
    articles
  end

  defp fetch_json(pair) do
    case HTTPoison.get(pair) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def mark_favourite_by_author(news,author) do
    favourite = Enum.filter(news, fn x -> x.author == author end)
    favourite = [favourite, Time.utc_now()]
  end


  def unmark_favourite_by_author(favourite, time_limit) do
    if Time.diff(Time.utc_now(), Enum.at(favourite,1)) >= time_limit do
    favourite = Enum.reject(favourite, fn x -> x end)
    favourite
    else
      favourite
    end
  end



  def start_counter(%Limits{} = limits) do
    limits
    |> Counter.start_link()
  end

  def increament_counter(%Limits{} = limits, cost) do
    GenServer.cast(String.to_atom(limits.user_name), {:add_cost, cost})
  end

  def get_counter(%Limits{} = limits) do
    GenServer.call(String.to_atom(limits.user_name), :limits)
  end

  def maximum_rate(%Limits{} = limits, cost) do
    if limits.rate_limits == 10 do
      Counter.stop(%Limits{} = limits)
    else
      increament_counter(%Limits{} = limits, cost)
    end
  end

  defp to_atoms(%{
         "author" => author,
         "content" => content,
         "description" => description,
         "publishedAt" => date,
         "source" => source,
         "title" => title,
         "url" => url,
         "urlToImage" => image
       }) do
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
      {:ok, _android} -> 10
      {:ok, _ios} -> 20
      _ -> 100
    end
  end
end
