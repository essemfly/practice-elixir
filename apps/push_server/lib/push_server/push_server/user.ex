defmodule PushServer.PushServer.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :image, :string
    field :name, :string
    field :provider, :string
    field :uid, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :provider, :email, :image, :uid])
    |> validate_required([:name, :provider, :email, :image, :uid])
  end
end
