defmodule ElixirMedia.ArtistView do
  use ElixirMedia.Web, :view

  def render("index.json", %{artists: artists}) do
    %{
      artists: Enum.map(artists, &artist_json/1)
    }
  end

  def render("show.json", %{artist: artist}) do
    %{
      artist: artist_json(artist)
    }
  end

  def artist_json(artist) do
    %{
      title: artist.title,
      inserted_at: artist.inserted_at,
      updated_at: artist.updated_at
    }
  end
end

