defmodule Rocketnutri.Meals.CreateTest do
  use Rocketnutri.DataCase

  alias Ecto.Changeset
  alias Rocketnutri.Meals.{Create, Meal}

  describe "call/1" do
    test "return the user, when all parameter is valid" do
      params = %{
        description: "Coxa de Frango assada com pele",
        date: NaiveDateTime.utc_now(),
        calories: 110
      }

      assert {:ok, %Meal{} = meal} = Create.call(params)
      assert meal.description == "Coxa de Frango assada com pele"
    end

    test "return an error, when not informed required parameters" do
      params = %{}

      assert {:error,
              %Rocketnutri.Error{
                message: %{
                  calories: ["can't be blank"],
                  date: ["can't be blank"],
                  description: ["can't be blank"]
                },
                status: :bad_request
              }}
    end
  end
end
