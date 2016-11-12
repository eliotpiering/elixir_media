defmodule ElixirMedia.AlbumView do
  use ElixirMedia.Web, :view

  def render("index.json", %{albums: albums}) do
    %{
      albums: Enum.map(albums, &album_json/1)
    }
  end

  def render("show.json", %{album: album}) do
    %{
      album: album_json(album)
    }
  end

  def album_json(album) do
    %{
      title: album.title,
      songs: ElixirMedia.SongView.songs_json(album.songs),
    }
  end
end

