defmodule Rocketnutri.Meals.Meal do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    timestamps()
  end
end
