defmodule Mealixir.Meals.Update do
  alias Ecto.UUID
  alias Mealixir.{Meal, Repo}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, "Meal not found"}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
