defmodule ElixirMedia.ArtistController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Artist

  def index(conn, _params) do
    query = from a in Artist, preload: [songs: [:artist, :album]]
    artists = Repo.all query
    render conn, "index.json", artists: artists
  end

  def show(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)
    render(conn, "show.json", artist: artist)
  end

end
