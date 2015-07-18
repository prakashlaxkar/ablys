class Event < ActiveRecord::Base

	# Associations
	has_many :images, as: :image_holder, :dependent => :destroy
  validates :title, :description, :start_date, :presence => true
  belongs_to :user
	# has_many :videos, as: :video_holder, :dependent => :destroy

	accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => lambda { |a| a[:avatar].blank? }

end
