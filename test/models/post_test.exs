defmodule PhoenixEntries.PostTest do
  use PhoenixEntries.ModelCase

  alias PhoenixEntries.Post

  @valid_attrs %{content: "some content", published_at: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
