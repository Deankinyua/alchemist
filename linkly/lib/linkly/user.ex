defmodule Linkly.User do
  use Ecto.Schema
  alias Linkly.Bookmark

  schema "users" do
    field(:about, :string)
    field(:email, :string)
    field(:username, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])

    timestamps()
  end
end

# bob = %User{username: "bob"}
