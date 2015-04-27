defmodule InchCIGossip.ProjectsController do
  use InchCIGossip.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new_build(conn, params) do
    broadcast! "new_build", params
    json conn, "{OK: true}"
  end

  def update_build(conn, params) do
    broadcast! "update_build", params
    json conn, "{OK: true}"
  end

  defp broadcast!(event, payload) do
    project_uid = payload["project_uid"]
    InchCIGossip.Endpoint.broadcast! "projects:lobby", event, payload
    InchCIGossip.Endpoint.broadcast! "projects:#{project_uid}", event, payload
  end
end
