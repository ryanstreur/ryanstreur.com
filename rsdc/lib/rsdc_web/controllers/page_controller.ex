defmodule RsdcWeb.PageController do
  use RsdcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
