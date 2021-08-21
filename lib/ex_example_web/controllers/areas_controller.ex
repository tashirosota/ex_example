defmodule ExExampleWeb.AreasController do
  use ExExampleWeb, :controller
  alias ExExample.Repo
  alias ExExample.Area

  def index(conn, _params) do
    areas = Repo.all(Area)

    json(
      conn,
      %{
        names: Enum.map(areas, fn area -> area.name end)
      }
    )
  end
end
