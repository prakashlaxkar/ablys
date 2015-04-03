class Event < ActiveRecord::Base

	# Associations
	has_many :images, as: :image_holder
	has_many :videos, as: :video_holder

end
