defmodule Tome.Repo.Migrations.AddBookCounter do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :count, :integer, default: 0
    end
  end
end
