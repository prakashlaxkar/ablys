class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  default_scope order(created_at: :desc)
  
  has_attached_file :avatar, :styles => { :large => "512x512", :normal => "360x360", :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/avatars/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, :email, :dob, :f_name, :gender, :avatar, :gotra, :address, :city, :state, :phone, :pin_code, :marital_status, :qualification, :designation, :company_name, :income, :presence => true
  before_save :add_country
  
  def self.find_for_oauth(oauth_raw_data, oauth_user_data, signed_in_resource=nil )
    return User.where("(provider = '#{oauth_raw_data.provider}' AND uid = '#{oauth_raw_data.uid}') OR email='#{oauth_user_data.email}'").first || User.create!(name:oauth_user_data.name,
                            provider:oauth_raw_data.provider,
                            uid:oauth_raw_data.uid,
                            email:oauth_user_data.email,
                            avatar: URI.parse(oauth_raw_data.info.image.gsub("square", "normal").gsub("http","https")),
                            password:Devise.friendly_token[0,20]
                          )
  end

  def add_country
    self.country = "India"
  end

end
