defmodule PhoenixEntries.PageController do
  use PhoenixEntries.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
