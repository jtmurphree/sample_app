module UsersHelper

	#returns the gravatar (http://gravatar.com/) for the given user
<<<<<<< HEAD
	def gravatar_for(user, size)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar", size: size)
=======
	def gravatar_for(user, options = { size: 100 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
>>>>>>> 796e56ea5a821d7939d031e10c8dd51ad186a4e9
	end
end
