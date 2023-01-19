defmodule Rsdc.ResumeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rsdc.Resume` context.
  """

  @doc """
  Generate a experience.
  """
  def experience_fixture(attrs \\ %{}) do
    {:ok, experience} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~U[2023-01-18 21:23:00Z],
        name: "some name",
        start_date: ~U[2023-01-18 21:23:00Z]
      })
      |> Rsdc.Resume.create_experience()

    experience
  end
end
