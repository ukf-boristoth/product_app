defmodule ProductApp.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductApp.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        category: "some category",
        description: "some description",
        photo_url: "some photo_url",
        price: "120.5",
        stock: 42,
        title: "some title"
      })
      |> ProductApp.Catalog.create_product()

    product
  end
end
