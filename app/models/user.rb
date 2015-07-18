class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook], :authentication_keys => [:login]

  default_scope order(created_at: :desc)

  has_attached_file :avatar, :styles => { :large => "512x512", :normal => "360x360", :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/avatars/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 5.megabytes, :message => " : Uploading photo size should be less then 5 MB."
  has_many :events, dependent: :destroy

  validates :name, :dob, :f_name, :gender, :avatar, :gotra, :address, :city, :state, :phone, :pin_code, :marital_status, :qualification, :presence => true
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  before_save :add_country
  before_validation :create_email
  attr_accessor :login

  def self.find_for_oauth(oauth_raw_data, oauth_user_data, signed_in_resource=nil )
    binding.pry
    return User.where("(provider = '#{oauth_raw_data.provider}' AND uid = '#{oauth_raw_data.uid}') OR email='#{oauth_user_data.email}'").first || User.create!(name:oauth_user_data.name,
                            provider:oauth_raw_data.provider,
                            uid:oauth_raw_data.uid,
                            email:oauth_user_data.email,
                            avatar: URI.parse(oauth_raw_data.info.image.gsub("square", "normal").gsub("http","https")),
                            password:Devise.friendly_token[0,20]
                          )
  end

  def create_email
    self.email = "#{self.username.split(" ").first}#{rand(1..99)}@ablys.com" if self.email.blank?
  end

  def add_country
    self.country = "India"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

end
