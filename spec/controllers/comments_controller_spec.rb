require 'spec_helper'

describe CommentsController do
	let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project, user: user) }
  let!(:state) { FactoryGirl.create(:state) }


  context "a user without permission to set state" do
    before do
      sign_in(user)
    end


    it "cannot transition a state by passing through state_id" do
      post :create, { :comment => { :text => "Hacked!",
        :state_id => state.id },
        :ticket_id => ticket.id }
        ticket.reload
        ticket.state.should eql(nil)
      end
    end

    context "a user without permission to tag a ticket" do
    	before do
    		sign_in(user)
    		end

    	it "cannot tag a ticket when creating a comment" do
    		post :create, {comment: { text: "Tag!", tag_names: "one two"
    			},
    			ticket_id: ticket.id
    		}
    		ticket.reload
    		expect(ticket.tags).to be_empty
    	end
    end
end
