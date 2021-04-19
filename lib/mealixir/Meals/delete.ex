defmodule Mealixir.Meals.Delete do
  alias Ecto.UUID
  alias Mealixir.{Meal, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, "Meal not found"}
      meal -> Repo.delete(meal)
    end
  end
end
