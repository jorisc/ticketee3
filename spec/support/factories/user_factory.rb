FactoryGirl.define do
	factory :user do
		name 'asd'
		email 'sample@example.com'
		password 'asas'
		password_confirmation 'asas'

		factory :admin_user do
			admin true
		end
	end	
end