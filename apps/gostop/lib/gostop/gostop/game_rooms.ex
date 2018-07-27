defmodule Gostop.Gostop.GameRooms do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rooms" do
    field :base_fee, :float
    field :is_open, :boolean, default: false
    field :is_full, :boolean, default: false

    belongs_to :owner, Gostop.Auth.User
    belongs_to :client, Gostop.Auth.User

    timestamps()
  end

  @doc false
  def changeset(game_rooms, attrs) do
    game_rooms
    |> cast(attrs, [])
    |> validate_required([])
  end
end
