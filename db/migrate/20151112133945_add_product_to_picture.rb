class AddProductToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :product, index: true, foreign_key: true
  end
end
