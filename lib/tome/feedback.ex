defmodule Tome.Feedback do
  alias Tome.Repo
  alias Tome.Feedback.Rating

  def rate(book, stars) do
    book
    |> Rating.new()
    |> Rating.changeset(%{stars: stars})
    |> Repo.insert!()
  end

  def revise(book, stars) do
    book
    |> Rating.changeset(%{stars: stars})
    |> Repo.update!()
  end

  def delete(rating) do
    Repo.delete!(rating)
  end
end
