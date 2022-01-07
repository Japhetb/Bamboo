defmodule Bamboo.Analystsnews.Analystsnew do
  use Ecto.Schema
  import Ecto.Changeset

  schema "analystsnews" do
    field :author, :string
    field :content, :string
    field :source_url, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(analystsnew, attrs) do
    analystsnew
    |> cast(attrs, [:author, :title, :source_url, :content])
    |> validate_required([:author, :title, :source_url, :content])
    |> unique_constraint(:source_url)
  end
end
