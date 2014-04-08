class Asso < ActiveRecord::Base
	has_one :localisation, as: :localisable
end
