require "rails_helper"

RSpec.describe Product, type: :system do
  
  it "allows the user to add new product" do 
    visit new_product_path 
    fill_in :name, with: "Pears soap"
    fill_in "Product description", with: "Best soap in the world"
    fill_in "Product image url", with: "image url"
    click_on "Submit"
    expect(page).to have_content("Soap")
    expect(page).to have_content("Best soap in the world")
  end


  context "when editing the product" do 
    let!(:product) { Product.create!(name: "Lifeboy", image_url: "image url") } 
    it "allows the user to edit the product" do 
      visit root_path
      within(".edit-#{product.id}") do
        click_link("Edit")
        expect(current_path).to eq edit_product_path(product)
      end
    end
  end
  
  context "when deleting the product" do 
    let(:product) {Product.create!(name: "Dettol", image_url: "Kills all the germs that needs to be killed.")}
    it "when deleting the project" do
      visit root_path
      within(".edit-#{product.id}") do 
        click_link "Destroy"
      end
    end
  end
end