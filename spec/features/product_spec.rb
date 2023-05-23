require "rails_helper"

RSpec.describe Product, type: :system do
  it "goes to the right url when add new button is clicker" do 
    visit root_path
    click_link ("Add new product")
    expect(current_path).to eq new_product_path
  end
  
  it "allows the user to add new product" do 
    visit new_product_path 
    fill_in :name, with: "Pears soap"
    fill_in "Product description", with: "Best soap in the world"
    fill_in "Product price", with: 10.0
    click_on "Submit"
    expect(page).to have_content("Pears soap")
    expect(page).to have_content("Best soap in the world")
    expect(page).to have_content("10.0")
  end


  context "goes to the right path when editing the product and shows the correct content on the page" do 
    let!(:product) { Product.create!(name: "Volleyball", price: 10.0) } 
    it "allows the user to edit the product" do 
      visit root_path
      within(".product-#{product.id}") do
        click_link("Edit")
        expect(current_path).to eq edit_product_path(product)
      end
      expect(page).to have_field('Product name', with: 'Volleyball')
      expect(page).to have_field('Product price', with: 10.00)
    end
  end

  context "when deleting the product" do 
    let!(:product) {Product.create!(name: "Watch", description: "Watch", price: 10.0)}
    it "when deleting the project" do
      visit root_path
      within(".product-#{product.id}") do 
        click_link "Destroy"
      end
      expect(page).to_not have_content("Watch")
      expect(page).to_not have_content("Watch")
      # this should check if the class is present rather than content / that will be more effective - maybe
    end
  end
end