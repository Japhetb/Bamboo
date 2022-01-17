# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bamboo.Repo.insert!(%Bamboo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Bamboo.Repo
alias Bamboo.Analystsnews.Analystsnew


Repo.insert! %Analystsnew{author: "Brandon Luke", content: "Inside the script, you can read and write to any of your", source_url: "https://elixirschool.com/", title: "Work Hard"}
