defmodule PhoenixEntries.UserControllerTest do
  use PhoenixEntries.ConnCase

  alias PhoenixEntries.User
  @valid_attrs %{name: "some content", password: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    conn = assign(conn, :user, %User{})
    user = Repo.insert!(User.changeset(%User{}, %{
      name: "bob",
      password: "1234"
    }))

    {:ok, conn: conn, user: user}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, admin_user_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, admin_user_path(conn, :new)
    assert html_response(conn, 200) =~ "New user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, admin_user_path(conn, :create), user: @valid_attrs
    assert redirected_to(conn) == admin_user_path(conn, :index)
    assert Repo.get_by(User, %{name: @valid_attrs[:name]})
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, admin_user_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200) =~ "New user"
  end

  test "shows chosen resource", %{conn: conn, user: user} do
    conn = get conn, admin_user_path(conn, :show, user)
    assert html_response(conn, 200) =~ "Show user"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, admin_user_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn, user: user} do
    conn = get conn, admin_user_path(conn, :edit, user)
    assert html_response(conn, 200) =~ "Edit user"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn, user: user} do
    conn = put conn, admin_user_path(conn, :update, user), user: @valid_attrs
    assert redirected_to(conn) == admin_user_path(conn, :show, user)
    assert Repo.get_by(User, %{name: @valid_attrs[:name]})
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn, user: user} do
    conn = put conn, admin_user_path(conn, :update, user), user: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user"
  end

  test "deletes chosen resource", %{conn: conn, user: user} do
    conn = delete conn, admin_user_path(conn, :delete, user)
    assert redirected_to(conn) == admin_user_path(conn, :index)
    refute Repo.get(User, user.id)
  end
end
