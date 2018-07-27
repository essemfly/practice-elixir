defmodule Gostop.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :base_fee, :float
      add :is_open, :boolean, default: false, null: false
      add :is_full, :boolean, default: false, null: false
      add :owner, references(:users), null: true
      add :client, references(:users), null: true

      timestamps()
    end

  end
end
