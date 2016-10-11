defmodule ElixirMedia.ArtistController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Artist

  def index(conn, _params) do
    artists = Repo.all(Artist)
    render conn, "index.json", artists: artists
  end

  def show(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)
    render(conn, "show.json", artist: artist)
  end

end
