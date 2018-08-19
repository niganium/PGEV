class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      
      t.string :title
      t.text :content
      t.integer :user_id
      t.text :image
      t.string :area
    
      t.timestamps
    end
  end
end
