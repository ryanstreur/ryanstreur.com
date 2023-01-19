defmodule RsdcWeb.ExperienceController do
  use RsdcWeb, :controller

  alias Rsdc.Resume
  alias Rsdc.Resume.Experience

  def index(conn, _params) do
    experience = Resume.list_experience()
    render(conn, "index.html", experience: experience)
  end

  def new(conn, _params) do
    changeset = Resume.change_experience(%Experience{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"experience" => experience_params}) do
    case Resume.create_experience(experience_params) do
      {:ok, experience} ->
        conn
        |> put_flash(:info, "Experience created successfully.")
        |> redirect(to: Routes.experience_path(conn, :show, experience))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    experience = Resume.get_experience!(id)
    render(conn, "show.html", experience: experience)
  end

  def edit(conn, %{"id" => id}) do
    experience = Resume.get_experience!(id)
    changeset = Resume.change_experience(experience)
    render(conn, "edit.html", experience: experience, changeset: changeset)
  end

  def update(conn, %{"id" => id, "experience" => experience_params}) do
    experience = Resume.get_experience!(id)

    case Resume.update_experience(experience, experience_params) do
      {:ok, experience} ->
        conn
        |> put_flash(:info, "Experience updated successfully.")
        |> redirect(to: Routes.experience_path(conn, :show, experience))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", experience: experience, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    experience = Resume.get_experience!(id)
    {:ok, _experience} = Resume.delete_experience(experience)

    conn
    |> put_flash(:info, "Experience deleted successfully.")
    |> redirect(to: Routes.experience_path(conn, :index))
  end
end
