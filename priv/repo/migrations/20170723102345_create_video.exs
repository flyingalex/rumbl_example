defmodule Rumbl.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:videos, [:user_id])

  end

  @required_fields ~w(url title description) 
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do 
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
