defmodule Tikkun.Repo do
  use Ecto.Repo,
    otp_app: :tikkun,
    adapter: Ecto.Adapters.Postgres
end
