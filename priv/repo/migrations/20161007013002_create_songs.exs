defmodule ElixirMedia.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :path, :string
      add :title, :string
      add :album_id, :integer
      add :artist_id, :integer

      timestamps
    end
  end
end
