require 'spec_helper'
require 'factory_girl_rails'

feature "Editing Projects" do
	before do
		sign_in_as!(FactoryGirl.create(:admin_user))
		visit '/'
	end
	
	before do
		FactoryGirl.create(:project, name: "TextMate 2")
		visit "/"
		click_link "TextMate 2"
		click_link "Edit Project"
	end

	scenario "Updating a project" do
		fill_in "Name", :with => "TextMate 2 beta"
		click_button "Update Project"
		page.should have_content("Project has been updated.")
	end

	scenario "Updating a project with invalid attributions is bad" do
		fill_in "Name", :with => ""
		click_button "Update Project"
		page.should have_content("Project has not been updated.")
	end
end
