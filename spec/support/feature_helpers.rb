include Warden::Test::Helpers

module FeatureHelpers
  def login_customer
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    user
  end

  def login_store_owner
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    user
  end

  def log_out
    logout
  end
end