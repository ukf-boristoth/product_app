# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProductApp.Repo.insert!(%ProductApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ProductApp.Catalog.Product
alias ProductApp.Repo

products = [
  %Product{photo_url: "url1", title: "Product 1", description: "Description 1", category: "Category 1", price: 100.0, stock: 10},
  %Product{photo_url: "url2", title: "Product 2", description: "Description 2", category: "Category 2", price: 200.0, stock: 20},
  %Product{photo_url: "url3", title: "Product 3", description: "Description 3", category: "Category 3", price: 300.0, stock: 30},
  %Product{photo_url: "url4", title: "Product 4", description: "Description 4", category: "Category 4", price: 400.0, stock: 40},
  %Product{photo_url: "url5", title: "Product 5", description: "Description 5", category: "Category 5", price: 500.0, stock: 50},
  %Product{photo_url: "url6", title: "Product 6", description: "Description 6", category: "Category 6", price: 600.0, stock: 60},
  %Product{photo_url: "url7", title: "Product 7", description: "Description 7", category: "Category 7", price: 700.0, stock: 70},
  %Product{photo_url: "url8", title: "Product 8", description: "Description 8", category: "Category 8", price: 800.0, stock: 80},
  %Product{photo_url: "url9", title: "Product 9", description: "Description 9", category: "Category 9", price: 900.0, stock: 90},
  %Product{photo_url: "url10", title: "Product 10", description: "Description 10", category: "Category 10", price: 1000.0, stock: 100},
]

Enum.each(products, fn product -> Repo.insert!(product) end)
