class Voluntary < ActiveRecord::Base
	has_many :localisations, as: :localisable
end
