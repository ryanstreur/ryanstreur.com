defmodule RsdcWeb.UsersRegistrationController do
  use RsdcWeb, :controller

  alias Rsdc.Accounts
  alias Rsdc.Accounts.Users
  alias RsdcWeb.UsersAuth

  def new(conn, _params) do
    changeset = Accounts.change_users_registration(%Users{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"users" => users_params}) do
    case Accounts.register_users(users_params) do
      {:ok, users} ->
        {:ok, _} =
          Accounts.deliver_users_confirmation_instructions(
            users,
            &Routes.users_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "Users created successfully.")
        |> UsersAuth.log_in_users(users)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
