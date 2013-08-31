class Tag < ActiveRecord::Base
  has_many :relations
  has_many :posts, through: :relations

  validates :name, :presence => true
end
