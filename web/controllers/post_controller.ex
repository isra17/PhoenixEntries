defmodule PhoenixEntries.PostController do
  use PhoenixEntries.Web, :controller

  def index(conn, _params) do
    render conn, :index
  end

  def show(conn, %{"slug" => slug}) do
    render conn, :show, slug: slug
  end
end

