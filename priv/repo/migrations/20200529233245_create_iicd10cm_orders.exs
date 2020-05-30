defmodule Icd10cm.Repo.Migrations.CreateIicd10cmOrders do
  use Ecto.Migration

  def change do
    create table(:iicd10cm_orders) do
      add :order_number, :integer
      add :icd10cm_code, :string, size: 7
      add :is_header, :string, size: 1
      add :short_description, :string, size: 60
      add :long_description, :string
    end
  end
end
