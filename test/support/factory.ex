defmodule ElixirMedia.Factory do
  use ExMachina.Ecto, repo: ElixirMedia.Repo

  def song_factory do
    %ElixirMedia.Song{
      path: "/mnt/music/somthing",
      title: "title"
    }
  end
end
