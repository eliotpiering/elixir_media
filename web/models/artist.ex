defmodule ElixirMedia.Artist do
  use ElixirMedia.Web, :model

  schema "artist" do
    field :title
    has_many :albums, ElixirMedia.Album

    timestamps
  end
end
