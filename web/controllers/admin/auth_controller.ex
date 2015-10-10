defmodule PhoenixEntries.Admin.AuthController do
  use PhoenixEntries.Web, :controller

  alias PhoenixEntries.User

  plug :scrub_params, "auth" when action in [:auth]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def auth(conn, %{"auth" => auth_params}) do
    case PhoenixEntries.AuthService.authenticate(
        auth_params["username"],
        auth_params["password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> put_flash(:info, "Logged in!")
        |> redirect(to: admin_admin_path(conn, :index))
      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> render("index.html")
    end
  end

  def signout(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out!")
    |> redirect(to: post_path(conn, :index))
  end
end

