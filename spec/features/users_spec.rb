require "rails_helper"


RSpec.describe User, type: :system do 
  def login_as_user(user)
    visit new_session_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :confirm_password, with:  user.confirm_password
    click_on ("Submit")
  end

  let(:user) {User.new(email: "nabinojha47@gmail.com", password: "123456", confirm_password: "123456")}

  it "can sign up successfully" do 
   login_as_user(user)
   expect(page).to have_content("Sign out")
  end

  it "can sign out successfully" do 
    visit root_path
    login_as_user(user)
    click_link ("Sign out")
    expect(page).to have_content("Sign in")
  end

  it "cannot access products page when not authenticated" do 
    visit root_path
    expect(current_path).to eq new_session_path
  end

  it "can acess products page when authenticated" do 
    login_as_user(user)
    visit root_path
    expect(current_path).to eq root_path
  end

end