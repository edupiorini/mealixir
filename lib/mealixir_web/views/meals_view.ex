defmodule MealixirWeb.MealsView do
  use MealixirWeb, :view

  alias Mealixir.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal Created!",
      meal: meal
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  # def render("meals.json", [] = meals) do
  #   %{meals: meals}
  # end
end
