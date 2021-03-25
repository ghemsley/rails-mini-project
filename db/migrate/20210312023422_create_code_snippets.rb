class CreateCodeSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :code_snippets do |t|
      t.string :name
      t.text :code
      t.belongs_to :project
      t.belongs_to :user
      t.belongs_to :my_gist

      t.timestamps
    end
  end
end
