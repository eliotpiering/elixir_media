defmodule ElixirMedia.AlbumController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Album

  def index(conn, _params) do
    albums = Repo.all(Album)
    render conn, "index.json", albums: albums
  end

  def show(conn, %{"id" => id}) do
    album = Repo.get!(Album, id)
    render(conn, "show.json", album: album)
  end

end
