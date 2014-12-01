class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

		t.string :isbn
		t.string :title
		t.string :author
		t.text   :description
		t.integer :pages
		t.string  :cover_large_url
		t.string  :cover_small_url
		t.string :publisher
		t.string :cover_small_url 
		t.date :publish_date

        t.timestamps
    end

    add_index :books, :isbn, :unique => true

  end
end
