class MapsController < ApplicationController
	def display
		@locs = Localisation.all
	end
end
