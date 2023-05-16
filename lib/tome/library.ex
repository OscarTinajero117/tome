defmodule Tome.Library do
  import Tome.Library.BookQry
  alias Tome.Repo

  def recently_published_books() do
    new()
    |> published
    |> recent
    |> Repo.all()
  end

  def recent_beta_books() do
    new()
    |> beta
    |> recent
    |> Repo.all()
  end
end
