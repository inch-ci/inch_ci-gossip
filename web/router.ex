defmodule InchCIGossip.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InchCIGossip do
    pipe_through :browser # Use the default browser stack

    get "/", ProjectsController, :index
  end

  scope "/projects", InchCIGossip do
    pipe_through :api

    post "new_build", ProjectsController, :new_build
    post "update_build", ProjectsController, :update_build
  end

  # Other scopes may use custom stacks.
  # scope "/api", InchCIGossip do
  #   pipe_through :api
  # end

  socket "/ws", InchCIGossip do
    channel "projects:*", ProjectsChannel
  end
end
