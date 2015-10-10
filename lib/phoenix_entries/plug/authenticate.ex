defmodule PhoenixEntries.Plug.Authenticate do
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import Plug.Conn

  def init([]), do: nil

  def call(conn, _opts) do
    if not Dict.has_key? conn.assigns, :user do
      conn
      |> put_flash(:error, "You must be authenticated")
      |> redirect(to: PhoenixEntries.Router.Helpers.admin_auth_path(conn, :index))
      |> halt
    else
      conn
    end
  end
end

