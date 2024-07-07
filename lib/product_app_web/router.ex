# lib/product_app_web/router.ex

defmodule ProductAppWeb.Router do
  use ProductAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProductAppWeb do
    pipe_through :browser

    resources "/products", ProductController
  end
end
