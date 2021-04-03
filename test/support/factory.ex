defmodule Rocketnutri.Factory do
  use ExMachina.Ecto, repo: Rocketnutri.Repo

  alias Rocketnutri.Meals.Meal

  def meal_factory do
    %Meal{
      id: "8a05f226-94d0-41cf-a4cf-905a0612a573",
      description: "Express coffe",
      date: ~N[2021-03-30 08:00:00],
      calories: 137,
      inserted_at: ~N[2021-03-30 06:00:00],
      updated_at: ~N[2021-03-30 06:00:00]
    }
  end
end
