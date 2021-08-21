defmodule ExExample.Area do
  use Ecto.Schema
  import Ecto.Changeset

  schema "areas" do
    field :name, :string
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(area, attrs) do
    area
    |> cast(attrs, [:name, :created_at, :updated_at])
    |> validate_required([:name, :created_at, :updated_at])
  end
end
