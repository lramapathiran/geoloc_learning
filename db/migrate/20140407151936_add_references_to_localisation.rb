class AddReferencesToLocalisation < ActiveRecord::Migration
  def change
  	add_column :localisations, :localisable_id, :integer
  	add_column :localisations, :localisable_type, :string
  end
end
