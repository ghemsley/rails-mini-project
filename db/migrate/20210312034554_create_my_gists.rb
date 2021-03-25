class CreateMyGists < ActiveRecord::Migration[6.1]
  def change
    create_table :my_gists do |t|
      t.string :name
      t.text :description
      t.string :url
      t.belongs_to :project

      t.timestamps
    end
  end
end
