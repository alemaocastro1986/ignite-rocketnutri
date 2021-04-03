defmodule Rocketnutri.Meals.Update do
  import Ecto.Changeset

  alias Rocketnutri.Meals.Meal
  alias Rocketnutri.{Error, Helper, Repo}

  @meal_keys [:description, :date, :calories]

  def call(id, params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.not_found(:meal)}
      meal -> exec(meal, params)
    end
  end

  defp exec(meal, params) do
    meal
    |> cast(params, @meal_keys)
    |> validate_required(@meal_keys)
    |> validate_number(:calories, greater_than: 0)
    |> Repo.update()
    |> Helper.handle_response()
  end
end
