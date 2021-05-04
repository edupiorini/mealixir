defmodule Mealixir.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Mealixir.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :description, :string
    field :date, :utc_datetime_usec, default: DateTime.now!("Etc/UTC")
    field :calories, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calories, greater_than_or_equal_to: 0)
  end
end
