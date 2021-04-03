defmodule Rocketnutri do
  alias Rocketnutri.Meals.{Create, Repo, Update}

  defdelegate create_meal(params), to: Create, as: :call
  defdelegate update_meal(id, params), to: Update, as: :call
  defdelegate delete_meal(id), to: Repo, as: :delete
end
