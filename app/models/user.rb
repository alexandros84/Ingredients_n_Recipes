class User < ApplicationRecord
  
    has_many :drawers, dependent: :destroy 
    has_many :ingredients, dependent: :destroy
    has_many :recipes
    after_create :create_drawer
  
  #attr_accessor :remember_token
  
    validates :name, presence: true, length: { minimum: 5 } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, 
                                format: { with: VALID_EMAIL_REGEX },
                                 uniqueness: { case_sensitive: false}
                                 
    has_secure_password
  
    validates :password, presence: true, length: { minimum: 6 }
    
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
    
    
    def create_drawer
      self.drawers.create
    end
    
end
