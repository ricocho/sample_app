require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { :name => "Example User" ,
              :email => "user@example.com",
              :password => "foobar",
              :password_confirmation => "foobar" }
   end
  
  it "should create a new instance given valid attibutes" do
    User.create!(@attr)
  end
  
  it "should require name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  
  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
    
    it "should require a passing confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end
    
    it "should reject a short password" do
      short = "a" * 5
      User.new(@attr.merge(:password => "short", :password_confirmation => "short")).should_not be_valid
    end
    
    it "should reject a long password" do
      long = "a" * 50
      User.new(@attr.merge(:password => "long", :password_confirmation => "long")).should_not be_valid
    end
  end 
  
  describe "password encryption" do
    before(:each) do
      @user = User.create(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set an encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
  end
  
end
