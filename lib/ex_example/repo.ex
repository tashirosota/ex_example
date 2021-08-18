defmodule ExExample.Repo do
  use Ecto.Repo,
    otp_app: :ex_example,
    adapter: Ecto.Adapters.Postgres
end
