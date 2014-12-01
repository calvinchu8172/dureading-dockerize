class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email

      t.string :avatar_url
      t.string :facebook_uid  	
      
      t.string :fb_token
      t.string :fb_expires_at

      t.string :token # for ios login
      t.datetime :token_expired 
      
      t.timestamps
    end

    add_index :users, :facebook_uid

  end

end
