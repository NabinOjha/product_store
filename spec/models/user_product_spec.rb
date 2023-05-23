require "rails_helper"

RSpec.describe UserProduct, type: :model do 
  let(:product) {Product.create(name: "Bag", price: 10.0, image_url: "bag.jpg", description: "Best bag in the world")}
  let(:user) {User.create(email: "nabinojha47@gmail.com", password: "123456", confirm_password: "123456")}
  
  it "when quantity is less than 1" do 
    order = UserProduct.new(product_id: product.id, user_id: user.id, quantity: 0)
    order.validate
    expect(order.errors[:quantity]).to include ("must be greater than or equal to 1")
  end

  it "when quantity is greater than one" do 
    order = UserProduct.new(product_id: product.id, user_id: user.id, quantity: 1)
    expect(order).to be_valid
  end
end