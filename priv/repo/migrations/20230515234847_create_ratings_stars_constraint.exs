defmodule Tome.Repo.Migrations.CreateRatingsStarsConstraint do
  use Ecto.Migration

  def change do
    create constraint("ratings", "stars_min_one", check: "stars > 0")
    create constraint("ratings", "stars_max_five", check: "stars < 6")
  end
end
