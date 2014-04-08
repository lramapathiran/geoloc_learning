#README

```rails g model Asso
rails g model Voluntary
rails g model localisation
rails g  controller maps
rake db:migrate```

##1. Suivre les instructions sur [leaflet]:

	```(http://leafletjs.com/examples/quick-start.html)```

	###a. Introduire dans layout/application.html.erb au niveau du head:

		```<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
		<script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>
		```

	###b. placer une div pour la carte à l'endroit voulu: (ici dans la view display)

		```<div id="map"></div>
		<script>
			var map = L.map('map').setView([48.8637, 2.4495], 13);
			L.tileLayer('http://{s}.tile.cloudmade.com/API-key/997/256/{z}/{x}/{y}.png', {
    		attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    		maxZoom: 18
			}).addTo(map);
		</script>```

		Ici on rentre en dur les coordonnées [latitude,longitude] avec un zoom de 13
		Il faura penser à changer le fond de carte mis pas défaut qui ne fonctionne pas ici.
		Ex: [cloudmade.com/API-key/997/256/] est à modifier par [openstreetmap.com/]

	###c. Rentrer le code css pour la carte:

		```#map { height: 180px; }```

	###d. Vérifier que la carte affiche bien un pin avec un code en dur, en rentrant dans le script de la vue display

		```var marker = L.marker([48.8637, 2.4495]).addTo(map);```

	##2. Créer les variables longitude et latitude:
		```rails g migration AddCoordinatesToLocalisation latitude:float longitude:float
		rake db:migrate```

	##3. Faire les associations polymorphiques entre Assos et Localisations et Voluntaries et Localisations cf (http://guides.rubyonrails.org/association_basics.html)

	##4. Créer une migration: ```rails generate migration AddReferencesToLocalisation``` pour créer les champs nécessaire pour le polymorphisme: 
		```:localisable_id, :integer
  		   :localisable_type, :string``` 
	
	##5. Les coordonnées des pins sont rentrés en dur, il faut maintenant faire en sorte qu'ils s'affichent automatiquement lorsque l'utilisateur rentrera ses coordonnées! 

		a. Créer une variable d'instance @locs dans le controller map:
			```@locs = Localisation.all```
		b. Dans la vue display, on veut que chaque pin créé soit rentré dans un array puis affiché. On utilise donc les méthodes ```.each``` et ```.push```:

		```var markers = []

			<% @locs.each do |loc| %>
			<%= "markers.push( L.marker([#{loc.latitude}, #{loc.longitude}]).addTo(map) )" %>
			<% end %>```



























This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
