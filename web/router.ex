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

    get "/", PageController, :index
    resources "posts", PostController, only: [:index, :show] do
      resources "comments", CommentController, only: [:index, :create]
    end

    scope "/admin", Admin, as: :admin do
      resources "posts", PostController, only: [:index, :show] do
        resources "comments", CommentController, only: [:index, :create]
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixEntries do
  #   pipe_through :api
  # end
end
