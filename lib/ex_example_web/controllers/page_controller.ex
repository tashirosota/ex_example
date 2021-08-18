defmodule ExExampleWeb.PageController do
  use ExExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
