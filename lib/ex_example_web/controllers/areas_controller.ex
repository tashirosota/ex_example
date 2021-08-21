defmodule ExExampleWeb.AreasController do
  use ExExampleWeb, :controller

  def index(conn, _params) do
    areas = ExExample.Repo.all ExExample.Area
    json(
      conn,
      %{
        names: Enum.map(areas, fn(area) -> area.name end)
      }
    )
  end
end
