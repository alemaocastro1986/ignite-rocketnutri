defmodule Rocketnutri.Meals.UpdateTest do
  use Rocketnutri.DataCase, async: true

  import Rocketnutri.Factory

  alias Rocketnutri.Error
  alias Rocketnutri.Meals.{Meal, Update}

  describe "call/2" do
    setup do
      insert(:meal, id: "f9f22c17-add7-4c8f-966b-8d3aaebfc3f6")
      :ok
    end

    test "return a meal updated, when all parameter is valid" do
      id = "f9f22c17-add7-4c8f-966b-8d3aaebfc3f6"

      assert {:ok, %Meal{} = meal_updated} =
               Update.call(id, %{description: "Black Tea", calories: 80})

      assert meal_updated.description == "Black Tea"
      assert meal_updated.calories == 80
    end

    test "return an error, when user not found." do
      id = "6cd0c6d2-4ae7-44d6-8b08-32546391cdc5"

      assert {:error, %Error{message: "meal not found", status: :not_found}} =
               Update.call(id, %{description: "Black Tea", calories: 80})
    end
  end
end
