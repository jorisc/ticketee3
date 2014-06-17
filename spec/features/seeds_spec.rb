require 'spec_helper'

feature "Seed Data" do
	scenario "The basics" do
		load Rails.root + "db/seeds.rb"
		user = User.where(email: "admin@example.com").first!
		user.password = "admin"
		project = Project.where(name: "Ticketee Beta").first!

		sign_in_as!(user)
		click_link "Ticketee Beta"
		click_link "New Ticket"
		fill_in "Title", with: "Comment with state"
		fill_in "Description", with: "Comments always have a state."
		click_button "Create Ticket"

		within("#comment_state_id") do
			expect(page).to have_content("New")
			expect(page).to have_content("Open")
			expect(page).to have_content("Closed")
		end
	end


end