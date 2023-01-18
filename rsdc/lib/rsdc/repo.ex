defmodule Rsdc.Repo do
  use Ecto.Repo,
    otp_app: :rsdc,
    adapter: Ecto.Adapters.Postgres
end
