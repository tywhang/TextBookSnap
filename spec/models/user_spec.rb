require 'spec_helper'
require 'user'

describe User do
  it "should require a First Name" do
    user = User.create(
      last_name: "Bucks",
      email: "star@bucks.com",
   	  password: "asdfjkl;",
      password_confirmation: "asdfjkl;"
	  )
    user.should_not be_valid
  end

  it "should require a Last Name" do
    user = User.create(
      first_name: "Star",
      email: "star@bucks.com",
      password: "asdfjkl;",
      password_confirmation: "asdfjkl;"
    )
    user.should_not be_valid
  end

  it "should require an Email" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      password: "asdfjkl;",
      password_confirmation: "asdfjkl;"
    )
    user.should_not be_valid
  end

  it "should require valid Email formatting" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "starbuckscorp",
      password: "asdfjkl;",
      password_confirmation: "asdfjkl;"
    )
    user.should_not be_valid
  end

  it "should not save if email already exists" do
    User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "star@bucks.com",
      password: "asdfjkl;",
      password_confirmation: "asdfjkl;"
    )
    user = User.create(
      first_name: "Buddy",
      last_name: "Holly",
      email: "star@bucks.com",
      password: ";lkjfdsa",
      password_confirmation: ";lkjfdsa"
    )
    user.should_not be_valid
  end

  it "should require a Password" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "star@bucks.com",
      password_confirmation: "asdfjkl;"
    )
    user.should_not be_valid
  end

  it "should not save if password is less than 6 characters" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "star@bucks.com",
      password: "asdf",
      password_confirmation: "asdf"
    )
    user.should_not be_valid
  end

  it "should require a Password Confirmation" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "star@bucks.com",
      password: "asdfjkl;",
    )
    user.should_not be_valid
  end

  it "should not save if password and confirm password do not match" do
    user = User.create(
      first_name: "Star",
      last_name: "Bucks",
      email: "star@bucks.com",
      password: "asdfjkl;",
      password_confirmation: "asdfjkl"
    )
    user.should_not be_valid
  end
end