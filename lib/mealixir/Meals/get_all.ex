defmodule Mealixir.Meals.GetAll do
  alias Mealixir.Meal
  alias Mealixir.Repo

  def call do
    Meal
    |> Repo.all()
  end
end
