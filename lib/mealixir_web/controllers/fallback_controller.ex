defmodule MealixirWeb.FallbackController do
  use MealixirWeb, :controller

  alias Mealixir.Error
  alias MealixirWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end