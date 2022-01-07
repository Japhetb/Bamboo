defmodule Bamboo.Repo.Migrations.CreateAnalystsnews do
  use Ecto.Migration

  def change do
    create table(:analystsnews) do
      add :author, :string
      add :title, :string
      add :source_url, :string
      add :content, :text

      timestamps()
    end
  end
end
