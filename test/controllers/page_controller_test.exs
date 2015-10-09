defmodule PhoenixEntries.PageControllerTest do
  use PhoenixEntries.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
