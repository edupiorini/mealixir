defmodule MealixirWeb.UsersController do
  use MealixirWeb, :controller

  alias Mealixir.User
  alias MealixirWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Mealixir.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
