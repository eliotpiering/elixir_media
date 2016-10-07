defmodule ElixirMedia.Song do
  use ElixirMedia.Web, :model

  schema "songs" do
    field :path
    field :title
    belongs_to :artist, ElixirMedia.Artist
    belongs_to :album, ElixirMedia.Album

    timestamps
  end
end
