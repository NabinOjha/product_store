require "rails_helper"


RSpec.describe User, type: :model do 
  it "when email is not present" do 
    user =  User.new(email: nil, password: "123456", confirm_password: "123456")
    user.validate
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "when password is not present" do 
    user =  User.new(email: "nabinojha47@gmail.com", password: nil, confirm_password: "123456")
    user.validate
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "when confirm password is not present" do 
    user =  User.new(email: "nabinojha47@gmail.com", password: "123456", confirm_password: nil)
    user.validate
    expect(user.errors[:confirm_password]).to include("can't be blank")
  end

  it "when there are duplicate emails" do 
    user1 = User.new(email: "nabinojha47@gmail.com", password: "123456", confirm_password: "123456")
    user2 = User.new(email: "nabinojha47@gmail.com", password: "123456", confirm_password: "123456")
    user1.save
    user2.validate
    expect(user2.errors[:email]).to include("has already been taken")
  end
end