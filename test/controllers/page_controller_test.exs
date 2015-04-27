defmodule InchCIGossip.PageControllerTest do
  use InchCIGossip.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Welcome to Phoenix!"
  end
end
