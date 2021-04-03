defmodule RocketnutriWeb.FallbackController do
  use RocketnutriWeb, :controller

  alias Rocketnutri.Error
  alias RocketnutriWeb.ErrorView

  def call(conn, {:error, %Error{status: :not_found, message: message}}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render("404.json", message: message)
  end

  def call(conn, {:error, %Error{status: _status, message: message}}) do
    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("400.json", message: message)
  end

  # coveralls-ignore-start
  def call(conn, {:error, _error}) do
    conn
    |> put_status(500)
    |> put_view(ErrorView)
    |> render("500.json", message: "Internal server error")

    # coveralls-ignore-stop
  end
end
