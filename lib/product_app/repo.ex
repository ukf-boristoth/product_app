defmodule ProductApp.Repo do
  use Ecto.Repo,
    otp_app: :product_app,
    adapter: Ecto.Adapters.Postgres
end
