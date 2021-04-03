defmodule Rocketnutri.Meals.Create do
  import Ecto.Changeset

  alias Rocketnutri.Meals.Meal
  alias Rocketnutri.{Helper, Repo}

  @meal_keys [:description, :date, :calories]

  def call(params) do
    %Meal{}
    |> cast(params, @meal_keys)
    |> validate_required(@meal_keys)
    |> validate_number(:calories, greater_than: 0)
    |> Repo.insert()
    |> Helper.handle_response()
  end
end
