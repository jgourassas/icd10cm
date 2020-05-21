defmodule Icd10cm.Repo do
  use Ecto.Repo,
    otp_app: :icd10cm,
    adapter: Ecto.Adapters.Postgres
end
