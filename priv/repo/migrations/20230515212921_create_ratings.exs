defmodule Tome.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer
      add :book_id, references(:books, on_delete: :delete_all)

      timestamps()
    end
    create index(:ratings, :book_id)
  end
end
