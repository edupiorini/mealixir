defmodule Mealixir.Meals.Get do
  alias Mealixir.{Meal, Repo}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, "Meal not found"}
      meal -> {:ok, meal}
    end
  end
end
