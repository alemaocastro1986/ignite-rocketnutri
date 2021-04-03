defmodule RocketnutriWeb.MealsController do
  use RocketnutriWeb, :controller

  alias RocketnutriWeb.FallbackController

  alias Rocketnutri.Meals.Repo, as: MealRepo

  action_fallback FallbackController

  def show(conn, %{"id" => id}) do
    with {:ok, meal} <- MealRepo.get_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def create(conn, params) do
    with {:ok, meal} <- Rocketnutri.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, meal} <- Rocketnutri.update_meal(id, params) do
      conn
      |> put_status(:ok)
      |> render("update.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _meal} <- Rocketnutri.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> put_resp_content_type("application/json")
      |> json("")
    end
  end
end
