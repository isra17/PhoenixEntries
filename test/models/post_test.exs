defmodule PhoenixEntries.PostTest do
  use PhoenixEntries.ModelCase

  alias PhoenixEntries.Post

  @valid_attrs %{content: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with publish set to false unpublish Post" do
    changeset = Post.changeset(%Post{}, Map.merge(@valid_attrs, %{publish: "false"}))
    changeset = Post.check_publish(changeset)
    refute changeset.changes[:published_at]
  end

  test "changeset with publish set to true publish Post" do
    changeset = Post.changeset(%Post{}, Map.merge(@valid_attrs, %{publish: "true"}))
    changeset = Post.check_publish(changeset)
    assert changeset.changes[:published_at]
  end
end
