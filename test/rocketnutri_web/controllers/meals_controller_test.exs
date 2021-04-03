defmodule RocketnutriWeb.MealsControllerTest do
  use RocketnutriWeb.ConnCase, async: true

  import Rocketnutri.Factory

  describe "show/2" do
    test "return a meal, when id exists and valid", %{conn: conn} do
      insert(:meal, id: "132d4179-fca0-4e88-8de5-5c41d9bbae99")

      response =
        conn
        |> get(Routes.meals_path(conn, :show, "132d4179-fca0-4e88-8de5-5c41d9bbae99"))
        |> json_response(:ok)

      assert response == %{
               "meal" => %{
                 "calories" => 137,
                 "date" => "2021-03-30T08:00:00",
                 "description" => "Express coffe",
                 "id" => "132d4179-fca0-4e88-8de5-5c41d9bbae99"
               }
             }
    end

    test "return an error, when id not found", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, "132d4179-fca0-4e88-8de5-5c41d9bbae95"))
        |> json_response(:not_found)

      assert response == %{
               "error" => %{"message" => "meal not found"}
             }
    end

    test "return an error, when id is invalid", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, "132d4179-fca0-4e88-8de5-5c41d9bbae9"))
        |> json_response(:bad_request)

      assert response == %{
               "error" => %{"message" => "Invalid UUID"}
             }
    end
  end

  describe "create/2" do
    test "return a meal, when all parameters is valid", %{conn: conn} do
      params = %{description: "Focaccia Classica", date: "2021-04-05 21:00:00", calories: 234}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calories" => 234,
                 "date" => "2021-04-05T21:00:00",
                 "description" => "Focaccia Classica",
                 "id" => _uuid
               }
             } = response
    end

    test "return an error, when one or more paremeters are not informed.", %{conn: conn} do
      params = %{date: "2021-04-05 21:00:00", calories: 234}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"error" => %{"description" => ["can't be blank"]}} = response
    end

    test "return an error, when date is invalid", %{conn: conn} do
      params = %{
        description: "Hamburger bacon cheedar",
        date: "2021-04-05",
        calories: 420
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"error" => %{"date" => ["is invalid"]}} = response
    end

    test "return an error, when calories less than one", %{conn: conn} do
      params = %{
        description: "Hamburger bacon cheedar",
        date: "2021-04-05 20:00:00",
        calories: 0
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"error" => %{"calories" => ["must be greater than 0"]}} = response
    end
  end

  describe "update/2" do
    setup do
      insert(:meal, id: "65bee0e4-7792-4970-a593-37c25966d69d", description: "Pain au levain")
      :ok
    end

    test "return a meal updated, when parameters are valid.", %{conn: conn} do
      params = %{
        description: "Sourdough bread"
      }

      id = "65bee0e4-7792-4970-a593-37c25966d69d"

      response =
        conn
        |> put("/api/meals/#{id}", params)
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 137,
                 "date" => "2021-03-30T08:00:00",
                 "description" => "Sourdough bread",
                 "id" => "65bee0e4-7792-4970-a593-37c25966d69d"
               }
             } = response
    end

    test "return an error when id not exists.", %{conn: conn} do
      params = %{
        description: "Sourdough bread"
      }

      id = "65bee0e4-7792-4970-a593-37c25964d69d"

      response =
        conn
        |> put("/api/meals/#{id}", params)
        |> json_response(:not_found)

      assert %{"error" => %{"message" => "meal not found"}} = response
    end

    test "return an error, when calories less than one.", %{conn: conn} do
      params = %{
        "calories" => 0
      }

      id = "65bee0e4-7792-4970-a593-37c25966d69d"

      response =
        conn
        |> put("/api/meals/#{id}", params)
        |> json_response(:bad_request)

      assert %{"error" => %{"calories" => ["must be greater than 0"]}} = response
    end

    test "return an error, when invalid id", %{conn: conn} do
      params = %{
        "calories" => 321
      }

      id = "65bee0e4-7792-4970-a593-3c25966d69d"

      response =
        conn
        |> put("/api/meals/#{id}", params)
        |> json_response(:bad_request)

      assert %{"error" => %{"message" => "Invalid UUID"}} = response
    end

    test "return an error, when invalid date", %{conn: conn} do
      params = %{
        "date" => "2021-03-32 20:00:00"
      }

      id = "65bee0e4-7792-4970-a593-37c25966d69d"

      response =
        conn
        |> put("/api/meals/#{id}", params)
        |> json_response(:bad_request)

      assert %{"error" => %{"date" => ["is invalid"]}} = response
    end
  end

  describe "delete/2" do
    setup do
      insert(:meal, id: "65bee0e4-7792-4970-a593-37c25966d69d")
      :ok
    end

    test "return status 204, when meal is deleted", %{conn: conn} do
      response =
        conn
        |> delete("api/meals/65bee0e4-7792-4970-a593-37c25966d69d", %{})
        |> json_response(:no_content)

      assert response == ""
    end

    test "return an error, when id not found", %{conn: conn} do
      response =
        conn
        |> delete("api/meals/65bee0e4-7792-4770-a593-37c25966d69d", %{})
        |> json_response(:not_found)

      assert %{"error" => %{"message" => "meal not found"}} = response
    end

    test "return an error, when id is invalid", %{conn: conn} do
      response =
        conn
        |> delete("api/meals/65bee0e4-77-4770-a593-37c25966d69d", %{})
        |> json_response(:bad_request)

      assert %{"error" => %{"message" => "Invalid UUID"}} = response
    end
  end
end
