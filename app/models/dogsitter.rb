class Dogsitter < ApplicationRecord
	has_many :strolls
	has_many :dogsitters, through: :strolls
end
