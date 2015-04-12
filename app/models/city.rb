class City < ActiveRecord::Base
	validates :name, :state, presence: true
	validates_uniqueness_of :name, scope: :state

	before_validation :set_titleize

	def set_titleize
		self.name = self.name.titleize
	end

end
