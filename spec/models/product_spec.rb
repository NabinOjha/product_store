require "rails_helper"


RSpec.describe Product, type: :model do 
  it "when name is not present" do
    expect(Product.new(image_url: "image_url")).to_not be_valid
  end

  it "when image_url is not present" do 
    expect(Product.new(name: "Critical")).to_not be_valid
  end

  it "when name and image_url both are present" do 
    expect(Product.new(name: "Saboon", image_url: "saboon.jpg")).to be_valid
  end
end