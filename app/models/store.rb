class Store < ActiveRecord::Base
  belongs_to :user
  has_many :products

  validate :creator_is_store_owner, on: :create

  private
  def creator_is_store_owner
    errors.add(:user_id, 'You can\t do that') unless self.user.store_owner

  end
end
