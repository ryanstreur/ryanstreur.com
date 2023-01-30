defmodule RsdcWeb.PageController do
  use RsdcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def contact(conn, _params) do
    render(conn, "contact-qr.html")
  end
end
