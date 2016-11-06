defmodule ImportSongs do

  #TODO test this
  def import(file_name) do
    case File.read(file_name) do
      {_, :eisdir} ->

        IO.inspect("is dir")
        sub_files = Enum.map(File.ls!(file_name), fn(f) ->
          Path.join([file_name, f])
        end)
        # IO.puts("sub_files is #{IO.inspect sub_files}")
        Enum.map(sub_files, fn(f) -> ImportSongs.import(f) end)

      {:ok, _} ->
        # IO.puts("song is #{file_name}")
        {id3_tag, _} = System.cmd("id3info", [file_name])
        id3_tags = String.split(id3_tag, "\n")
        song = Enum.reduce(id3_tags, %{path: file_name}, fn(tag, song) ->
          extract_tag_and_store(tag, song)
        end)

        case song do
          %{title: _, artist: _, album: _, year: _, track: _} ->
            artist_id = find_or_new_artist(song[:artist])
            album_id = find_or_new_album(song[:album])
            find_or_new_song(song, artist_id, album_id)
            IO.inspect(song)
          _ ->

            IO.puts("couldn't parse ----- ")
            IO.inspect(song)
        end

       _ ->
       IO.puts("error")
    end
  end

  defp find_or_new_artist(artist_name) do
    repo_artist = ElixirMedia.Repo.get_by(ElixirMedia.Artist, title: artist_name)
    #TODO is there a way to write without if like find |> artist.id || insert_and_id
    IO.puts(is_nil repo_artist )
    if is_nil repo_artist do
      model = %ElixirMedia.Artist{title: artist_name}
      case ElixirMedia.Repo.insert(model) do
        {:ok, artist} ->
          artist.id
        {:error, changeset} ->
          #TODO raise error
          IO.puts("couldn't insert #{artist_name}")
      end
    else
      repo_artist.id
    end
  end

  defp find_or_new_album(album_name) do
    #TODO this find_by should take an artist into account
    repo_album = ElixirMedia.Repo.get_by(ElixirMedia.Album, title: album_name)
    if is_nil repo_album do
      model = %ElixirMedia.Album{title: album_name}
      case ElixirMedia.Repo.insert(model) do
        {:ok, artist} ->
          artist.id
        {:error, changeset} ->
          #TODO raise error
          IO.puts("couldn't insert #{album_name}")
      end
    else
      repo_album.id
    end
  end

  defp find_or_new_song(song, artist_id, album_id) do
    #TODO find by song title artist_id and album_id
    repo_song = ElixirMedia.Repo.get_by(ElixirMedia.Song, title: song.title)
    if is_nil repo_song do
      IO.puts("new song")
      model = %ElixirMedia.Song{title: song.title, path: song.path, year: song.year, track: song.track, artist_id: artist_id, album_id: album_id}
      ElixirMedia.Repo.insert(model)
    end
  end

  # Basted off of the output from id3info
  defp extract_tag_and_store("=== TIT2 (Title/songname/content description): " <> title, song) do
    Map.put(song, :title, title)
  end

  defp extract_tag_and_store("=== TYER (Year): " <> year, song) do
    {y, _} = Integer.parse(year)
    Map.put(song, :year, y)
  end

  defp extract_tag_and_store("=== TRCK (Track number/Position in set): " <> track, song) do
    {t, _} = Integer.parse(track)
    Map.put(song, :track, t)
  end

  defp extract_tag_and_store("=== TCON (Content type): " <> genre, song) do
    Map.put(song, :genre, genre)
  end

  defp extract_tag_and_store("=== TPE1 (Lead performer(s)/Soloist(s)): " <> artist, song) do
    Map.put(song, :artist, artist)
  end

  defp extract_tag_and_store("=== TALB (Album/Movie/Show title): " <> album, song) do
    Map.put(song, :album, album)
  end

  defp extract_tag_and_store(no_match, song) do
    song
  end

end


ImportSongs.import("/home/eliot/Music/")
ImportSongs.import("/mnt/music/")
