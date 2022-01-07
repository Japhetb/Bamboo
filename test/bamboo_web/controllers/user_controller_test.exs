defmodule BambooWeb.UserControllerTest do
  use BambooWeb.ConnCase

  import Bamboo.AccountsFixtures

  alias Bamboo.Accounts.User

  @create_attrs %{
    email: "some email",
    encrypted_password: "some encrypted_password",
    user_name: "some user_name"
  }
  @update_attrs %{
    email: "some updated email",
    encrypted_password: "some updated encrypted_password",
    user_name: "some updated user_name"
  }
  @invalid_attrs %{email: nil, encrypted_password: nil, user_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
