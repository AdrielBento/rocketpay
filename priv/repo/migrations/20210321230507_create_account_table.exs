defmodule Rocketpay.Repo.Migrations.CreateAccountTable do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :balance, :decimal
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create constraint(:accounts, :balance_must_be_positive_or_negative, check: "balance >= 0")
  end
end
