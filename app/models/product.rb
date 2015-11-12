class Product < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  #validates :price, presence: true
  validates :price, numericality: { only_integer: true}

  has_many :pictures, dependent: :destroy

end
