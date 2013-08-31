class CreateRelations < ActiveRecord::Migration
  def change
  	create_table :relations do |t|
  		t.belongs_to :post
  		t.belongs_to :tag
  		t.timestamps
  	end
  	add_index(:relations, [:post_id, :tag_id], :unique => true)
  end
end
