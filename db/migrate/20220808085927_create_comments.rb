class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author, null: false, index: true
      t.references :post, null: false, index: true

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id
  end
end
