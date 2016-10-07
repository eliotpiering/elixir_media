defmodule ElixirMedia.SongController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Song

  def index(conn, _params) do
    songs = Repo.all(Song)
    render conn, "index.json", songs: songs
  end

  def show(conn, %{"id" => id}) do
    song= Repo.get!(Song, id)
    render(conn, "show.json", song: song)
  end

end
