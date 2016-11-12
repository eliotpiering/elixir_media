# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirMedia.Repo.insert!(%ElixirMedia.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# wu_tang = ElixirMedia.Repo.insert!(%ElixirMedia.Song{title: "Wu Tang"})
# thirty_six_chambers = ElixirMedia.Repo.insert!(%ElixirMedia.Song{title: "Enter the 36 Chambers", artist: wu_tang})
# # thirty_six_chambers_songs
# ElixirMedia.Repo.insert!(%ElixirMedia.Song{path: "/mnt/music/Wu-Tang\ Clan/Enter\ the\ Wu-Tang\ \(36\ Chambers\)/Bring da Ruckus.mp3",  title: "Bring da Ruckus", album: thirty_six_chambers, artist: wu_tang})

