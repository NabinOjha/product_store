require "rails_helper"

RSpec.describe Product, type: :model do 
  it "when name is not present" do
    product = Product.new(name: nil, price: 1.0)
    product.validate
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "when price is not present" do 
    product = Product.new(name: "Product 1", image_url: "product_image.jpg", description: "Description of the product")
    product.validate
    expect(product.errors[:price]).to include("can't be blank")
  end

  it "when price is zero" do 
    product = Product.new(name: "Keyboard", image_url: "keyboard.jpg", price: 0.00)
    product.validate
    expect(product.errors[:price]).to include("must be greater than 0.01")
  end

  it "when the name and price is present" do 
    product = Product.new(name: "Mouse", price: 240)
    product.validate
    expect(product.errors).to be_empty
  end

  it "when there are duplicate product names" do 
    product1 = Product.new(name: "Product", price: 240.0)
    product2 = Product.new(name: "Product", price: 240.0)
    product1.save
    product2.validate
    expect(product2.errors[:name]).to include("has already been taken")
  end
end