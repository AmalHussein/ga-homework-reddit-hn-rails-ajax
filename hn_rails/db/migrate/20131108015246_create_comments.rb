class CreateComments < ActiveRecord::Migration
  
  def change
    create_table :comments do |t|
    	t.text :body 
    	t.string :title
    	t.integer :up_votes 
      t.belongs_to :post
      t.belongs_to :user
    	t.timestamps 
    end
  end

  def down 
  	drop_table :comments
  end 


end
