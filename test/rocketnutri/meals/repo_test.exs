defmodule Rocketnutri.Meals.RepoTest do
  use Rocketnutri.DataCase, async: true

  import Rocketnutri.Factory

  alias Rocketnutri.Error
  alias Rocketnutri.Meals.{Meal, Repo}

  describe "get_by_id/1" do
    test "return a meal, when an id exists" do
      insert(:meal, id: "da568b20-3901-471e-b99b-29f4b25eb438")

      assert {:ok,
              %Meal{id: "da568b20-3901-471e-b99b-29f4b25eb438", description: "Express coffe"}} =
               Repo.get_by_id("da568b20-3901-471e-b99b-29f4b25eb438")
    end

    test "return an error, when id not exists" do
      assert {:error, %Error{message: "meal not found", status: :not_found}} =
               Repo.get_by_id("8ab80c3e-bd05-4e14-810f-ac05e542465e")
    end
  end

  describe "delete/1" do
    test "return ok, when meal is deleted." do
      insert(:meal, id: "da568b20-3901-471e-b99b-29f4b25eb439")

      assert {:ok, %Meal{}} = Repo.delete("da568b20-3901-471e-b99b-29f4b25eb439")
    end

    test "return an error, when id not exists" do
      assert {:error, %Error{message: "meal not found", status: :not_found}} =
               Repo.delete("8ab80c3e-bd05-4e14-810f-ac05e542465e")
    end
  end
end
