defmodule ElixirMedia.Router do
  use ElixirMedia.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


    # Add this scope for handling API requests
  scope "/api", ElixirMedia do
    pipe_through :api

    resources "/songs", SongController, only: [:index, :show]
    resources "/albums", AlbumController, only: [:index, :show]
    resources "/artists", ArtistController, only: [:index, :show]
  end

  scope "/", ElixirMedia do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirMedia do
  #   pipe_through :api
  # end
end
