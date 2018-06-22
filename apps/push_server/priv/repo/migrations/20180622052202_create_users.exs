defmodule PushServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :provider, :string
      add :email, :string
      add :image, :string
      add :uid, :uuid

      add(:inserted_at, :timestamptz, null: false, default: fragment("now()"))
      add(:updated_at, :timestamptz, null: false, default: fragment("now()"))
    end

    create unique_index(:users, [:email])
  end
end
