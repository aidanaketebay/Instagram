class SessionsController < ApplicationController

	def create 
		login = params[:session][:login]
		if login.include? "@"
			user = User.find_by_email(login)
		else
			user = User.find_by_username(login)
		end
    if user && user.authenticate(params[:session][:password])
      sign_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user

		else
			flash[:error] = "Invalid name or password"
			render "new"

		end
	end

	def new 
	end

	def destroy 
		sign_out if signed_in?
		redirect_to root_path
	end
end
