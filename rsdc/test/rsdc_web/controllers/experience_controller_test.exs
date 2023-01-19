defmodule RsdcWeb.ExperienceControllerTest do
  use RsdcWeb.ConnCase

  import Rsdc.ResumeFixtures

  @create_attrs %{
    description: "some description",
    end_date: ~U[2023-01-18 21:23:00Z],
    name: "some name",
    start_date: ~U[2023-01-18 21:23:00Z]
  }
  @update_attrs %{
    description: "some updated description",
    end_date: ~U[2023-01-19 21:23:00Z],
    name: "some updated name",
    start_date: ~U[2023-01-19 21:23:00Z]
  }
  @invalid_attrs %{description: nil, end_date: nil, name: nil, start_date: nil}

  describe "index" do
    test "lists all experience", %{conn: conn} do
      conn = get(conn, Routes.experience_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Experience"
    end
  end

  describe "new experience" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.experience_path(conn, :new))
      assert html_response(conn, 200) =~ "New Experience"
    end
  end

  describe "create experience" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.experience_path(conn, :create), experience: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.experience_path(conn, :show, id)

      conn = get(conn, Routes.experience_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Experience"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.experience_path(conn, :create), experience: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Experience"
    end
  end

  describe "edit experience" do
    setup [:create_experience]

    test "renders form for editing chosen experience", %{conn: conn, experience: experience} do
      conn = get(conn, Routes.experience_path(conn, :edit, experience))
      assert html_response(conn, 200) =~ "Edit Experience"
    end
  end

  describe "update experience" do
    setup [:create_experience]

    test "redirects when data is valid", %{conn: conn, experience: experience} do
      conn =
        put(conn, Routes.experience_path(conn, :update, experience), experience: @update_attrs)

      assert redirected_to(conn) == Routes.experience_path(conn, :show, experience)

      conn = get(conn, Routes.experience_path(conn, :show, experience))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, experience: experience} do
      conn =
        put(conn, Routes.experience_path(conn, :update, experience), experience: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Experience"
    end
  end

  describe "delete experience" do
    setup [:create_experience]

    test "deletes chosen experience", %{conn: conn, experience: experience} do
      conn = delete(conn, Routes.experience_path(conn, :delete, experience))
      assert redirected_to(conn) == Routes.experience_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.experience_path(conn, :show, experience))
      end
    end
  end

  defp create_experience(_) do
    experience = experience_fixture()
    %{experience: experience}
  end
end
