defmodule MealixirWeb.MealsController do
  use MealixirWeb, :controller

  alias Mealixir.Meal
  alias MealixirWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Mealixir.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Mealixir.show_meal(id) do
      conn
      |> put_status(:created)
      |> render("meal.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Mealixir.update_meal(params) do
      conn
      |> put_status(:created)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Mealixir.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  # def index(conn, _params) do
  #   meals = Mealixir.show_all()

  #   conn
  #   |> put_status(:created)
  #   |> render("meals.json", meals)
  # end
end
