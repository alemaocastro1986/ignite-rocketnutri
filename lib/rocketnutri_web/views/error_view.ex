defmodule RocketnutriWeb.ErrorView do
  use RocketnutriWeb, :view

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("404.json", %{message: message}) do
    %{error: %{message: message}}
  end

  def render("400.json", %{message: message}) do
    %{error: message}
  end

  def render("500.json", %{message: message}) do
    %{errors: %{message: message}}
  end
end
