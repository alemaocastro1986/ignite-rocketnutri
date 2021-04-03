defmodule Rocketnutri.Error do
  defstruct [:status, :message]

  def build(message, status) do
    %__MODULE__{status: status, message: message}
  end

  def not_found(resource) when is_atom(resource) do
    "#{Atom.to_string(resource)} not found"
    |> build(:not_found)
  end

  def bad_request(message) do
    message
    |> build(:bad_request)
  end
end
