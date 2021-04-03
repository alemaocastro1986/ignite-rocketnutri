defmodule RocketnutriWeb.MealsViewTest do
  use RocketnutriWeb.ConnCase, async: true

  import Rocketnutri.Factory
  import Phoenix.View

  alias Rocketnutri.Meals.Meal

  test "renders create.json" do
    meal = build(:meal)
    response = render(RocketnutriWeb.MealsView, "create.json", meal: meal)

    assert response == %{
             meal: %Meal{
               calories: 137,
               date: ~N[2021-03-30 08:00:00],
               description: "Express coffe",
               id: "8a05f226-94d0-41cf-a4cf-905a0612a573",
               inserted_at: ~N[2021-03-30 06:00:00],
               updated_at: ~N[2021-03-30 06:00:00]
             }
           }
  end

  test "renders update.json" do
    meal = build(:meal)

    response = render(RocketnutriWeb.MealsView, "update.json", meal: meal)

    assert response == %{
             meal: %Meal{
               calories: 137,
               date: ~N[2021-03-30 08:00:00],
               description: "Express coffe",
               id: "8a05f226-94d0-41cf-a4cf-905a0612a573",
               inserted_at: ~N[2021-03-30 06:00:00],
               updated_at: ~N[2021-03-30 06:00:00]
             }
           }
  end

  test "renders show.json" do
    meal = build(:meal)

    response = render(RocketnutriWeb.MealsView, "show.json", meal: meal)

    assert response == %{
             meal: %Meal{
               calories: 137,
               date: ~N[2021-03-30 08:00:00],
               description: "Express coffe",
               id: "8a05f226-94d0-41cf-a4cf-905a0612a573",
               inserted_at: ~N[2021-03-30 06:00:00],
               updated_at: ~N[2021-03-30 06:00:00]
             }
           }
  end
end
