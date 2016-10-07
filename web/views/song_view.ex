defmodule ElixirMedia.SongView do
  use ElixirMedia.Web, :view

  def render("index.json", %{songs: songs}) do
    %{
      songs: Enum.map(songs, &song_json/1)
    }
  end

  def render("show.json", %{song: song}) do
    %{
      song: song_json(song)
    }
  end

  def song_json(song) do
    %{
      path: song.path,
      title: song.title,
      inserted_at: song.inserted_at,
      updated_at: song.updated_at
    }
  end
end

