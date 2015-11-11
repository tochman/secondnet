require 'rails_helper'
require 'spec_helper'

describe 'products' do

  before do
    visit '/products'
  end

  context 'no products have been added yet and user visits the page' do

    scenario 'it should display a message that there are no products' do
      expect(page).to have_content 'There are no products in the system yet.'
    end
  end

  context 'new post have been added' do

    before do
      Product.create(title: 'New item')
      visit '/products'
    end

    scenario 'should list added products' do
      expect(page).to have_content 'New item'
      expect(page).not_to have_content 'There are no products in the system yet.'
    end
  end
end
