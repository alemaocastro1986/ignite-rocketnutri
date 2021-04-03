defmodule Rocketnutri.Meals.Repo do
  alias Rocketnutri.Meals.Meal
  alias Rocketnutri.{Error, Repo}

  def get_by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.not_found(:meal)}
      meal -> {:ok, meal}
    end
  end

  def delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.not_found(:meal)}
      meal -> Repo.delete(meal)
    end
  end
end
