defmodule PhoenixEntries.User do
  use PhoenixEntries.Web, :model
  use Ecto.Model.Callbacks

  schema "users" do
    field :name, :string
    field :password_hash, :string

    field :password, :string, virtual: true

    timestamps
  end

  before_insert :hash_password
  before_insert :hash_password

  @required_fields ~w(name password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def hash_password(changeset) do
    password_hash = PhoenixEntries.AuthService.hashed_password(changeset.params["password"])
    put_change(changeset, :password_hash, password_hash)
  end
end
