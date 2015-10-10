defmodule PhoenixEntries.Plug.LoadUser do
  import Plug.Conn

  alias PhoenixEntries.User

  def init([]), do: nil

  def call(conn, _opts) do
    case get_session(conn, :current_user) do
      %User{} = user -> assign(conn, :user, user)
      nil -> conn
    end
  end
end

