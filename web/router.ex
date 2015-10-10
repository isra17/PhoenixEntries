defmodule PhoenixEntries.Router do
  use PhoenixEntries.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixEntries do
    pipe_through :browser # Use the default browser stack

    resources "users", UserController

    get "/", PostController, :index
    resources "posts", PostController do
      resources "comments", CommentController, only: [:index, :create]
    end

    scope "/admin", Admin, as: :admin do
      get "/", AdminController, :index
      resources "posts", PostController do
        resources "comments", CommentController, only: [:index, :create]
      end

      resources "users", UserController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixEntries do
  #   pipe_through :api
  # end
end
