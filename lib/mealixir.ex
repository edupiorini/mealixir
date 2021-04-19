defmodule Mealixir do
  alias Mealixir.Meals.{Create, Delete, Get, Update}

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate delete_meal(id), to: Delete, as: :call
  defdelegate show_meal(id), to: Get, as: :call
  defdelegate update_meal(params), to: Update, as: :call
end
