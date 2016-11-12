defmodule ElixirMedia.StreamController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Stream

  def show(conn, %{"id" => id}) do
    song = Repo.get!(ElixirMedia.Song, id)
    path = song.path
    conn
    |> Plug.Conn.put_resp_header("content-type", "audio/mp3")
    |> Plug.Conn.send_file(200, path)
  end

end
