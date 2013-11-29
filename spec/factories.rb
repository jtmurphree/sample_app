FactoryGirl.define do
	factory :user do
		name	"Jason Murphree"
		email	"jtmurphree@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end