defmodule ElixirMedia.PageController do
  use ElixirMedia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
