defmodule Rsdc.Repo.Migrations.CreateExperience do
  use Ecto.Migration

  def change do
    create table(:experience) do
      add :name, :string
      add :description, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime

      timestamps()
    end
  end
end
