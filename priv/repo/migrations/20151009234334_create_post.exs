defmodule PhoenixEntries.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :published_at, :datetime

      timestamps
    end

  end
end
