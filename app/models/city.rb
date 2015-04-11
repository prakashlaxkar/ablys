class City < ActiveRecord::Base
	validates :name, :state, presence: true
end
