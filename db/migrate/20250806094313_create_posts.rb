class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author_name
      t.references :category, null: false, foreign_key: true
      t.boolean :anonymous

      t.timestamps
    end
  end
end
