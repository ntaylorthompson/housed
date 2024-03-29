class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, 
  :musician, :header, :website, :mp3_1_url, :mp3_2_url, :active, :zip, :travel_radius, :style
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  has_many :shows, dependent: :destroy 
  has_many :availabilities, dependent: :destroy 
  has_one :location, dependent: :destroy 
  
  accepts_nested_attributes_for :location
  
  scope :musician, where(musician: true)

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
#  validates :password, length: { minimum: 6 }   DID THIS TO SUBMIT ACTIVATION BUTTON
#  validates :password_confirmation, presence: true
  
 
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
 