defmodule RocketnutriWeb.ErrorViewTest do
  use RocketnutriWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(RocketnutriWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(RocketnutriWeb.ErrorView, "500.json", %{message: "Internal Server Error"}) ==
             %{errors: %{message: "Internal Server Error"}}
  end
end
