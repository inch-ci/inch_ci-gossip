defmodule InchCIGossip.ProjectsChannel do
  use Phoenix.Channel

  def join("projects:lobby", auth_msg, socket) do
    {:ok, socket}
  end

  def join("projects:" <> _project_uid, _auth_msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_build", %{"build_number" => build_number, "build_id" => build_id, "build_status" => build_status, "build_url" => build_url, "build_started_at" => build_started_at, "project_uid" => project_uid, "branch_name" => branch_name}, socket) do
    broadcast! socket, "new_build", %{"build_number" => build_number, "build_id" => build_id, "build_status" => build_status, "build_url" => build_url, "build_started_at" => build_started_at, "project_uid" => project_uid, "branch_name" => branch_name}
    {:noreply, socket}
  end

  def handle_out("new_build", payload, socket) do
    push socket, "new_build", payload
    {:noreply, socket}
  end

  def handle_in("update_build", %{"build_number" => build_number, "build_id" => build_id, "build_status" => build_status, "build_url" => build_url, "build_started_at" => build_started_at, "project_uid" => project_uid, "branch_name" => branch_name}, socket) do
    broadcast! socket, "update_build", %{"build_number" => build_number, "build_id" => build_id, "build_status" => build_status, "build_url" => build_url, "build_started_at" => build_started_at, "project_uid" => project_uid, "branch_name" => branch_name}
    {:noreply, socket}
  end

  def handle_out("update_build", payload, socket) do
    push socket, "update_build", payload
    {:noreply, socket}
  end
end
