defmodule ProductApp.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :title, :string
    field :category, :string
    field :photo_url, :string
    field :price, :decimal
    field :stock, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:photo_url, :title, :description, :category, :price, :stock])
    |> validate_required([:photo_url, :title, :description, :category, :price, :stock])
  end
end
