class AddLogoToBooks < ActiveRecord::Migration
  def change
  	add_attachment :books, :logo
  end
end
