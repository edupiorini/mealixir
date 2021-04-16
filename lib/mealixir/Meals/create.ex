defmodule Mealixir.Meals.Create do
  alias Mealixir.{Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, _result}), do: {:error, "Something went wrong"}
end
