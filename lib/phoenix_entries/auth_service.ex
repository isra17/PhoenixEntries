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
end
