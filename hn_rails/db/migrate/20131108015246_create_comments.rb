class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :body 
    	t.string :title
    	t.integer :post_id 
    	t.integer :up_votes 
    	t.text :user_id
    	t.timestamps 
    end
  end

  def down 
  	drop_table :comments
  end 

  add_index :comments , :post_id

end
