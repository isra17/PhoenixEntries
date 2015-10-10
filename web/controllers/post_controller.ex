defmodule PhoenixEntries.PostController do
  use PhoenixEntries.Web, :controller

  alias PhoenixEntries.Post

  plug :scrub_params, "post" when action in [:create, :update]

  def index(conn, _params) do
    posts = Repo.all(from p in Post, order_by: [desc: p.id])
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post)
  end
end

