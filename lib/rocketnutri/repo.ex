defmodule Rocketnutri.Repo do
  use Ecto.Repo,
    otp_app: :rocketnutri,
    adapter: Ecto.Adapters.Postgres
end
