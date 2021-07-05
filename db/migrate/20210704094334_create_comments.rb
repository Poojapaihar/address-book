class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
    	t.text :add_comment
    	t.integer :record_id
    	t.timestamps
    end
  end
end
