defmodule PhoenixEntries.Post do
  use PhoenixEntries.Web, :model

  schema "posts" do
    field :title, :string
    field :content, :string
    field :published_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title content published_at)
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
end
