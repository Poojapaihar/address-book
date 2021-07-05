class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
    	t.string :first_name
    	t.string :last_name
    	t.text :address
    	t.text :phone
    	t.string :email
    	t.timestamps
    end
  end
end
