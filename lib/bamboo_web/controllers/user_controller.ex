defmodule BambooWeb.UserController do
  use BambooWeb, :controller

  alias Bamboo.Accounts
  alias Bamboo.Accounts.User
  alias BambooWeb.Auth.Guardian

  action_fallback BambooWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
    {:ok, token, _full_claims} = Guardian.encode_and_sign(user, %{some: "claim"}, ttl: {12, :hour}) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    else
       _->
        conn
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end
end
