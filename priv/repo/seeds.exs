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


ElixirMedia.Repo.insert!(%ElixirMedia.Song{path: "/mnt/music/Wu_tang_clan/Ghost_Dog_The_Way_Of_The_Samurai/Fast_swadow.mp3", title: "Fast Shadow"})
