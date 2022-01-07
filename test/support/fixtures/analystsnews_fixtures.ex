defmodule Bamboo.AnalystsnewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bamboo.Analystsnews` context.
  """

  @doc """
  Generate a analystsnew.
  """
  def analystsnew_fixture(attrs \\ %{}) do
    {:ok, analystsnew} =
      attrs
      |> Enum.into(%{
        author: "some author",
        content: "some content",
        source_url: "some source_url",
        title: "some title"
      })
      |> Bamboo.Analystsnews.create_analystsnew()

    analystsnew
  end
end
