require "rails_helper"

RSpec.describe "adding a product", type: :system do
  it "allows the user to add new product" do 
    visit new_product_path 
    fill_in :name, with: "Soap"
    fill_in "Product description", with: "Best soap in the world"
    click_on "Submit"
    visit products_path
    expect(page).to have_content("Soap")
    expect(page).to have_content("Best soap in the world")
  end

  # it "allows the user to edit the product" do 
  # end

end