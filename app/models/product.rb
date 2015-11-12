class Product < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  #validates :price, presence: true
  validates :price, numericality: { only_integer: true}

  has_many :pictures, dependent: :destroy
  belongs_to :store
  accepts_nested_attributes_for :pictures, allow_destroy: true


end
