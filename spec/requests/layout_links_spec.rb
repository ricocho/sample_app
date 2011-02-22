require 'spec_helper'

describe "LayoutLinks" do

   it "should have a home page at '/'" do
   get '/'
   response.should have_selector('title', :content => "home")
   end
   
   it "should have a contact page at '/contact'" do
   get '/contact'
   response.should have_selector('title', :content => "contact")
   end   
   
   it "should have a about page at '/about'" do
   get '/about'
   response.should have_selector('title', :content => "about")
   end 

   it "should have a contact page at '/help'" do
   get '/help'
   response.should have_selector('title', :content => "help")
   end
   
   it "should have a signup page at '/signup'" do
   get '/signup'
   response.should have_selector('title', :content => "Sign Up")
   end
   
   it "should have the right links on layout" do
     visit root_path
     click_link "About"
     response.should have_selector('title', :content => "about")
     click_link "Help"
     response.should have_selector('title', :content => "help")
     click_link "Contact"
     response.should have_selector('title', :content => "contact")
     click_link "Home"
     response.should have_selector('title', :content => "home")
     click_link "Sign Up now!"
     response.should have_selector('title', :content => "Sign Up")     
   end
    
end
