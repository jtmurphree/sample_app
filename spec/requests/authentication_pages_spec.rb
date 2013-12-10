require 'spec_helper'

describe "Authentication" do
	subject { page }
	describe "signin page" do
		before { visit signin_path }
		it { should be_signin_page}
	end

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Sign in" }

	 		it { should have_title('Sign in') }
	 		it { should have_error_message('Invalid') }

	 		describe "after visiting another page" do
	 			before { click_link "Home" }
	 			it { should_not have_error_message('Invalid')} 
	 		end
	 	end

	 	describe "with valid information" do
	 		let(:user) { FactoryGirl.create(:user)}
	 		before do
	 			fill_in "Email",		with: user.email.upcase
	 			fill_in "Password",		with: user.password
	 			click_button "Sign in"
	 		end

	 		it { should be_signedin(user) }

	 		describe "followed by signout" do
	 			before {click_link "Sign out" }
	 			it { should be_signedout(user) }
	 		end
	 	end
	end
end
