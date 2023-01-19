defmodule Rsdc.ResumeTest do
  use Rsdc.DataCase

  alias Rsdc.Resume

  describe "experience" do
    alias Rsdc.Resume.Experience

    import Rsdc.ResumeFixtures

    @invalid_attrs %{description: nil, end_date: nil, name: nil, start_date: nil}

    test "list_experience/0 returns all experience" do
      experience = experience_fixture()
      assert Resume.list_experience() == [experience]
    end

    test "get_experience!/1 returns the experience with given id" do
      experience = experience_fixture()
      assert Resume.get_experience!(experience.id) == experience
    end

    test "create_experience/1 with valid data creates a experience" do
      valid_attrs = %{
        description: "some description",
        end_date: ~U[2023-01-18 21:23:00Z],
        name: "some name",
        start_date: ~U[2023-01-18 21:23:00Z]
      }

      assert {:ok, %Experience{} = experience} = Resume.create_experience(valid_attrs)
      assert experience.description == "some description"
      assert experience.end_date == ~U[2023-01-18 21:23:00Z]
      assert experience.name == "some name"
      assert experience.start_date == ~U[2023-01-18 21:23:00Z]
    end

    test "create_experience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resume.create_experience(@invalid_attrs)
    end

    test "update_experience/2 with valid data updates the experience" do
      experience = experience_fixture()

      update_attrs = %{
        description: "some updated description",
        end_date: ~U[2023-01-19 21:23:00Z],
        name: "some updated name",
        start_date: ~U[2023-01-19 21:23:00Z]
      }

      assert {:ok, %Experience{} = experience} =
               Resume.update_experience(experience, update_attrs)

      assert experience.description == "some updated description"
      assert experience.end_date == ~U[2023-01-19 21:23:00Z]
      assert experience.name == "some updated name"
      assert experience.start_date == ~U[2023-01-19 21:23:00Z]
    end

    test "update_experience/2 with invalid data returns error changeset" do
      experience = experience_fixture()
      assert {:error, %Ecto.Changeset{}} = Resume.update_experience(experience, @invalid_attrs)
      assert experience == Resume.get_experience!(experience.id)
    end

    test "delete_experience/1 deletes the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{}} = Resume.delete_experience(experience)
      assert_raise Ecto.NoResultsError, fn -> Resume.get_experience!(experience.id) end
    end

    test "change_experience/1 returns a experience changeset" do
      experience = experience_fixture()
      assert %Ecto.Changeset{} = Resume.change_experience(experience)
    end
  end
end
