defmodule ExExampleWeb.AreasController do
  use ExExampleWeb, :controller

  def index(conn, params) do
    IO.inspect(params)
    json(
      conn,
      Map.merge(%{id: :test}, params)
    )
  end
end
