defmodule Rocketnutri.Helper do
  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset
  alias Rocketnutri.Error

  def handle_response({:ok, resource}), do: {:ok, resource}

  def handle_response({:error, %Changeset{valid?: false} = changeset}) do
    errors =
      changeset
      |> traverse_errors(fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)
      end)

    {:error, Error.bad_request(errors)}
  end

  def handle_response({:error, error}), do: {:error, Error.bad_request(error)}
end
