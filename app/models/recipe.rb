class Recipe < ApplicationRecord
  belongs_to :user 
  has_many :ingredients
  has_many :drawer_quantities, dependent: :destroy
  
end
