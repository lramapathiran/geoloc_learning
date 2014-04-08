class AddCoordinatesToLocalisation < ActiveRecord::Migration
  def change
    add_column :localisations, :latitude, :float
    add_column :localisations, :longitude, :float
  end
end
