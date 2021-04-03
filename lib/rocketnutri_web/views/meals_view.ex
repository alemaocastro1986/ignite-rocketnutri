defmodule RocketnutriWeb.MealsView do
  use RocketnutriWeb, :view

  def render("show.json", %{meal: meal}) do
    %{meal: meal}
  end

  def render("create.json", %{meal: meal}) do
    %{meal: meal}
  end

  def render("update.json", %{meal: meal}) do
    %{meal: meal}
  end
end
