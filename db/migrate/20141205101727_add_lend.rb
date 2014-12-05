class AddLend < ActiveRecord::Migration
  def change

    add_column :user_books, :lend_to_user_id, :integer 
    add_column :user_books, :borrow_from_user_id, :integer 

    add_index :user_books, :lend_to_user_id
    add_index :user_books, :borrow_from_user_id
  end
  
end
