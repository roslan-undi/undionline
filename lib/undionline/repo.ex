defmodule Undionline.Repo do
  use Ecto.Repo,
    otp_app: :undionline,
    adapter: Ecto.Adapters.Postgres
end
