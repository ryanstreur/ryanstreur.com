defmodule TikkunWeb.PageController do
  use TikkunWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
