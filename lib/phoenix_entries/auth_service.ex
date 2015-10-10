defmodule PhoenixEntries.AuthService do
  import Ecto.Changeset, only: [put_change: 3]

  alias PhoenixEntries.User

  def register(user_changeset, repo) do
    user_changeset
    |> put_change(:password_hash, hashed_password(user_changeset.params["password"]))
    |> repo.insert
  end

  def authenticate(username, password) do
    Aeacus.Authenticator.authenticate %{
      identity: username,
      password: password,
    }
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  defmodule AuthentifierPlug do
    import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
    import Plug.Conn

    def init(caps), do: caps

    def call(conn, caps) do
      case Plug.Conn.get_session(conn, :current_user) do
        nil ->
          conn
          |> put_flash(:error, "You must be authenticated")
          |> redirect(to: PhoenixEntries.Router.Helpers.admin_auth_path(conn, :index))
          |> halt
        %User{} = user -> assign(conn, :user, user)
      end
    end
  end
end
