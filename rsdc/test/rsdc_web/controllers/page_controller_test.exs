defmodule RsdcWeb.PageControllerTest do
  use RsdcWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Ryan Streur"
  end
end
