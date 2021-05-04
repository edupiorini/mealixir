defmodule MealixirWeb.UsersView do
  use MealixirWeb, :view

  alias Mealixir.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User Created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
