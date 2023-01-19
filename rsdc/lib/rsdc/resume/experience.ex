defmodule Rsdc.Resume.Experience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "experience" do
    field :description, :string
    field :end_date, :utc_datetime
    field :name, :string
    field :start_date, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:name, :description, :start_date, :end_date])
    |> validate_required([:name, :description, :start_date, :end_date])
  end
end
