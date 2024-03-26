defmodule Linkly.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.{Bookmark, Link, LinkTag, Tag, User}

  schema "users" do
    field(:about, :string)
    field(:birthdate, :date, virtual: true)
    field(:email, :string)
    field(:username, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])
    has_many(:taggings, LinkTag)
    many_to_many(:tagged_links, Link, join_through: LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
     |> cast(user, attrs, [:username, :email, :birthdate, :about])
     |> validate_required([[:username, :email, :birthdate]])
     |> validate_length(:username, min: 3)
  end
end

# bob = %User{username: "bob"}
