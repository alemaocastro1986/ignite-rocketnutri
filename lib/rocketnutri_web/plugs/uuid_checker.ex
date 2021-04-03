defmodule RocketnutriWeb.Plugs.UUIDChecker do
  import Plug.Conn
  alias Ecto.UUID
  # coveralls-ignore-start
  def init(default), do: default
  # coveralls-ignore-stop

  def call(%Plug.Conn{params: %{"id" => id}} = conn, _default) do
    case UUID.cast(id) do
      :error -> handle_error(conn)
      {:ok, _uuid} -> conn
    end
  end

  def call(conn, _opts), do: conn

  defp handle_error(%Plug.Conn{} = conn) do
    body = Jason.encode!(%{error: %{message: "Invalid UUID"}})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
