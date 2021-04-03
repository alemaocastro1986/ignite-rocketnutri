defmodule Rocketnutri.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals, primary_key: false do
      add :id, :uuid, primary_key: true
      add :description, :string, null: false
      add :date, :naive_datetime, null: false
      add :calories,  :integer, null: false

      timestamps()
    end
  end
end
