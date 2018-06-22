defmodule PushServer.User do
  import Ecto.Changeset
  import Ecto.Query
  
  use Ecto.Schema
  
  alias PushServer.Repo
  alias Ueberauth.Auth
  alias __MODULE__

  require Logger

  schema "users" do
    field :name, :string
    field :provider, :string
    field :email, :string
    field :image, :string
    field :uid, :string
  end

  @new_added [
    :email,
    :provider,
    :email,
    :image,
    :uid
  ]

  @new_required [
    :email,
    :provider
  ]

  def new_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @new_added)
    |> validate_required(@new_required)
  end

  def get_by_email(email) do
    User
    |> where(email: ^email)
    |> Repo.one!
  end

  def find_or_create(%Auth{} = auth) do
    {:ok, basic_info(auth)}
  end

  #facebook does it this way
  defp avatar_from_auth( %{info: %{image: image} }), do: image

  # default case if nothing matches
  defp avatar_from_auth( auth ) do
    Logger.warn auth.provider <> " needs to find an avatar URL!"
    Logger.debug(Poison.encode!(auth))
    nil
  end

  defp basic_info(auth) do
    %{id: auth.uid, name: name_from_auth(auth), avatar: avatar_from_auth(auth)}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end
end