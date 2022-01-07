defmodule BambooWeb.AnalystsnewControllerTest do
  use BambooWeb.ConnCase

  import Bamboo.AnalystsnewsFixtures

  alias Bamboo.Analystsnews.Analystsnew

  @create_attrs %{
    author: "some author",
    content: "some content",
    source_url: "some source_url",
    title: "some title"
  }
  @update_attrs %{
    author: "some updated author",
    content: "some updated content",
    source_url: "some updated source_url",
    title: "some updated title"
  }
  @invalid_attrs %{author: nil, content: nil, source_url: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all analystsnews", %{conn: conn} do
      conn = get(conn, Routes.analystsnew_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create analystsnew" do
    test "renders analystsnew when data is valid", %{conn: conn} do
      conn = post(conn, Routes.analystsnew_path(conn, :create), analystsnew: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.analystsnew_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => "some author",
               "content" => "some content",
               "source_url" => "some source_url",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.analystsnew_path(conn, :create), analystsnew: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update analystsnew" do
    setup [:create_analystsnew]

    test "renders analystsnew when data is valid", %{
      conn: conn,
      analystsnew: %Analystsnew{id: id} = analystsnew
    } do
      conn =
        put(conn, Routes.analystsnew_path(conn, :update, analystsnew), analystsnew: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.analystsnew_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => "some updated author",
               "content" => "some updated content",
               "source_url" => "some updated source_url",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, analystsnew: analystsnew} do
      conn =
        put(conn, Routes.analystsnew_path(conn, :update, analystsnew), analystsnew: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete analystsnew" do
    setup [:create_analystsnew]

    test "deletes chosen analystsnew", %{conn: conn, analystsnew: analystsnew} do
      conn = delete(conn, Routes.analystsnew_path(conn, :delete, analystsnew))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.analystsnew_path(conn, :show, analystsnew))
      end
    end
  end

  defp create_analystsnew(_) do
    analystsnew = analystsnew_fixture()
    %{analystsnew: analystsnew}
  end
end
