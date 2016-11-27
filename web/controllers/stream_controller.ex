defmodule ElixirMedia.StreamController do
  use ElixirMedia.Web, :controller

  alias ElixirMedia.Stream

  def show(%{req_headers: headers} = conn, %{"id" => id}) do
    song = Repo.get!(ElixirMedia.Song, id)
    path = song.path
    offset = get_offset(headers)
    file_size = get_file_size(path)

    conn
    |> Plug.Conn.put_resp_header("content-type", "audio/mp3")
    |> Plug.Conn.put_resp_header("content-range", "bytes #{offset}-#{file_size-1}/#{file_size}")
    |> Plug.Conn.send_file(206, path)
  end

  defp get_offset(headers) do
    case List.keyfind(headers, "range", 0) do
      {"range", "bytes=" <> start_pos} ->
        String.split(start_pos, "-") |> hd |> String.to_integer
      nil ->
        0
    end
  end

  defp get_file_size(path) do
    {:ok, %{size: size}} = File.stat path
    size
  end

end
