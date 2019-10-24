class City < ApplicationRecord
	has_many :dogs #Chaque ville contient plusieurs promeneurs et plusieurs chiens 
	has_many :dogsitters
end
