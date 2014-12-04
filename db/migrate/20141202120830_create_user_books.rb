class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end

    add_index :user_books, :book_id
    add_index :user_books, :user_id
  end
end
