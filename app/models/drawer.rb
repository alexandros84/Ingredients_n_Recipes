class Drawer < ApplicationRecord
  belongs_to :user
  has_many :drawer_quantities
end
