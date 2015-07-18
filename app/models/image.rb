class Image < ActiveRecord::Base

	# Associations
	belongs_to :image_holder, polymorphic: true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 5.megabytes, :message => " : Uploading photo size should be less then 5 MB."

end
