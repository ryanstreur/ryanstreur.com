defmodule RsdcWeb.Router do
  alias RsdcWeb.ExperienceController
  use RsdcWeb, :router

  import RsdcWeb.UsersAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RsdcWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_users
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsdcWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/contact-qr", PageController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsdcWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      resources "/experience", ExperienceController
      live_dashboard "/dashboard", metrics: RsdcWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", RsdcWeb do
    pipe_through [:browser, :redirect_if_users_is_authenticated]

    get "/users/register", UsersRegistrationController, :new
    post "/users/register", UsersRegistrationController, :create
    get "/users/log_in", UsersSessionController, :new
    post "/users/log_in", UsersSessionController, :create
    get "/users/reset_password", UsersResetPasswordController, :new
    post "/users/reset_password", UsersResetPasswordController, :create
    get "/users/reset_password/:token", UsersResetPasswordController, :edit
    put "/users/reset_password/:token", UsersResetPasswordController, :update
  end

  scope "/", RsdcWeb do
    pipe_through [:browser, :require_authenticated_users]

    get "/users/settings", UsersSettingsController, :edit
    put "/users/settings", UsersSettingsController, :update
    get "/users/settings/confirm_email/:token", UsersSettingsController, :confirm_email
  end

  scope "/", RsdcWeb do
    pipe_through [:browser]

    delete "/users/log_out", UsersSessionController, :delete
    get "/users/confirm", UsersConfirmationController, :new
    post "/users/confirm", UsersConfirmationController, :create
    get "/users/confirm/:token", UsersConfirmationController, :edit
    post "/users/confirm/:token", UsersConfirmationController, :update
  end
end
