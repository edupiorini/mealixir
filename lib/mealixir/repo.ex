defmodule Mealixir.Repo do
  use Ecto.Repo,
    otp_app: :mealixir,
    adapter: Ecto.Adapters.Postgres
end
