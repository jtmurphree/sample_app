module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

<<<<<<< HEAD
	def current_user?(user)
		user == current_user
	end

=======
>>>>>>> 796e56ea5a821d7939d031e10c8dd51ad186a4e9
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
<<<<<<< HEAD

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end
=======
>>>>>>> 796e56ea5a821d7939d031e10c8dd51ad186a4e9
end
