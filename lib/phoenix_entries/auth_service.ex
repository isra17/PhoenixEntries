defmodule PhoenixEntries.AuthService do
  import Ecto.Changeset, only: [put_change: 3]

  alias PhoenixEntries.User

  def authenticate(username, password) do
    Aeacus.Authenticator.authenticate %{
      identity: username,
      password: password,
    }
  end

  def hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
