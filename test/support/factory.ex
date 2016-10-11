defmodule ElixirMedia.Factory do
  use ExMachina.Ecto, repo: ElixirMedia.Repo

  def song_factory do
    %ElixirMedia.Song{
      path: "/mnt/music/somthing",
      title: "title"
    }
  end

  def artist_factory do
    %ElixirMedia.Artist{
      title: "artist title"
    }
  end

  def album_factory do
    %ElixirMedia.Album{
      title: "album title"
    }
  end

end
