include ApplicationHelper

def valid_signin(user)
	fill_in "Email",	with: user.Email
	fill_in "Password",	wit: user.password
	click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert-error', text: message)
	end
end

RSpec::Matchers.define :be_signedin do |user|
	match do |page|
		page { should have_title(user.name)}
		page { should have_link('Profile',		href: user_path(user)) }
		page { should have_link('Sign out', 		href: signout_path) }
		page { should_not have_link('Sin in', href: signin_path) }
	end
end

RSpec::Matchers.define :be_signedout do |user|
	match do |page|
		page { should have_link('Sign in', href: signin_path) }
	end
end

RSpec::Matchers.define :be_signin_page do
	match do |page|
		page { should have_content('Sign in') }
		page { should have_title('Sign in') }
	end
end