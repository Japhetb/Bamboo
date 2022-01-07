defmodule Bamboo.AnalystsnewsTest do
  use Bamboo.DataCase

  alias Bamboo.Analystsnews

  describe "analystsnews" do
    alias Bamboo.Analystsnews.Analystsnew

    import Bamboo.AnalystsnewsFixtures

    @invalid_attrs %{author: nil, content: nil, source_url: nil, title: nil}

    test "list_analystsnews/0 returns all analystsnews" do
      analystsnew = analystsnew_fixture()
      assert Analystsnews.list_analystsnews() == [analystsnew]
    end

    test "get_analystsnew!/1 returns the analystsnew with given id" do
      analystsnew = analystsnew_fixture()
      assert Analystsnews.get_analystsnew!(analystsnew.id) == analystsnew
    end

    test "create_analystsnew/1 with valid data creates a analystsnew" do
      valid_attrs = %{
        author: "some author",
        content: "some content",
        source_url: "some source_url",
        title: "some title"
      }

      assert {:ok, %Analystsnew{} = analystsnew} = Analystsnews.create_analystsnew(valid_attrs)
      assert analystsnew.author == "some author"
      assert analystsnew.content == "some content"
      assert analystsnew.source_url == "some source_url"
      assert analystsnew.title == "some title"
    end

    test "create_analystsnew/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analystsnews.create_analystsnew(@invalid_attrs)
    end

    test "update_analystsnew/2 with valid data updates the analystsnew" do
      analystsnew = analystsnew_fixture()

      update_attrs = %{
        author: "some updated author",
        content: "some updated content",
        source_url: "some updated source_url",
        title: "some updated title"
      }

      assert {:ok, %Analystsnew{} = analystsnew} =
               Analystsnews.update_analystsnew(analystsnew, update_attrs)

      assert analystsnew.author == "some updated author"
      assert analystsnew.content == "some updated content"
      assert analystsnew.source_url == "some updated source_url"
      assert analystsnew.title == "some updated title"
    end

    test "update_analystsnew/2 with invalid data returns error changeset" do
      analystsnew = analystsnew_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Analystsnews.update_analystsnew(analystsnew, @invalid_attrs)

      assert analystsnew == Analystsnews.get_analystsnew!(analystsnew.id)
    end

    test "delete_analystsnew/1 deletes the analystsnew" do
      analystsnew = analystsnew_fixture()
      assert {:ok, %Analystsnew{}} = Analystsnews.delete_analystsnew(analystsnew)
      assert_raise Ecto.NoResultsError, fn -> Analystsnews.get_analystsnew!(analystsnew.id) end
    end

    test "change_analystsnew/1 returns a analystsnew changeset" do
      analystsnew = analystsnew_fixture()
      assert %Ecto.Changeset{} = Analystsnews.change_analystsnew(analystsnew)
    end
  end
end
