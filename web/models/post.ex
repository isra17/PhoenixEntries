defmodule PhoenixEntries.Post do
  use PhoenixEntries.Web, :model

  schema "posts" do
    field :title, :string
    field :content, :string
    field :published_at, Ecto.DateTime, default: nil

    field :publish, :boolean, virtual: true

    timestamps
  end

  before_insert :check_publish
  before_update :check_publish

  @required_fields ~w(title content)
  @optional_fields ~w(publish)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def check_publish(%{changes: %{publish: publish}} = changeset) do
    published_at = if(publish, do: Ecto.DateTime.utc(), else: nil)
    put_change(changeset, :published_at, published_at)
  end

  def check_publish(changeset), do: changeset
end
