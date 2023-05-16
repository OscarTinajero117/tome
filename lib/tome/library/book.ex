defmodule Tome.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field(:title, :string)
    field(:isbn, :string)
    field(:description)
    field(:published_on, :date, default: nil)
    field(:status, :string, default: "working")
    field(:count, :integer, default: 0)

    timestamps()

    has_many(:ratings, Tome.Feedback.Rating)
  end

  def changeset(book, params \\ %{}) do
    book
    |> cast(params, [:title, :isbn, :description, :published_on, :status, :count])
    |> validate_required([:title, :isbn, :status])
    |> validate_inclusion(:status, ~w[working published beta retired])
    |> unique_constraint(:isbn)
  end

  def to_json(book) do
    Jason.decode!(book |> Map.from_struct() |> Map.drop([:__meta__, :id]))
  end
end
