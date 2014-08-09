class CreateHugs < ActiveRecord::Migration
  def change
  	create_table :hugs do |t|
  		t.integer :receiver_id
  		t.integer :giver_id

  		t.timestamps
  	end
  end
end
