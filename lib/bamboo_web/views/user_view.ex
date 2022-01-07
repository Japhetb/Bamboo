defmodule BambooWeb.UserView do
  use BambooWeb, :view
  alias BambooWeb.UserView

  def render("user.json", %{user: user, token: token}) do
    %{
      user_name: user.user_name,
      email: user.email,
      token: token
    }
  end
end
