defmodule PhoenixEntries.Plug.Authenticate do
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import Plug.Conn

  alias PhoenixEntries.User

  def init(_opts), do: _opts

  def call(conn, _opts) do
    case get_session(conn, :current_user) do
      %User{} = user -> assign(conn, :user, user)
      nil ->
        conn
        |> put_flash(:error, "You must be authenticated")
        |> redirect(to: PhoenixEntries.Router.Helpers.admin_auth_path(conn, :index))
        |> halt
    end
  end
end

