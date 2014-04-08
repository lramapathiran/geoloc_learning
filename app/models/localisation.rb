class Localisation < ActiveRecord::Base
	belongs_to :localisable, polymorphic: true
end
