defmodule InchCIGossip.PageController do
  use InchCIGossip.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
