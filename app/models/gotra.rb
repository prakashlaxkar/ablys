class Gotra < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name

	before_validation :set_titleize

	def set_titleize
		self.name = self.name.titleize
	end
end
