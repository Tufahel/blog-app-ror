class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, null: false, index: true
      t.references :post, null: false, index: true

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :users, column: :post_id
  end
end
