class SessionsController < ApplicationController
def new
  @title = "Sign in"
end

def create
  user = User.authenticate(params[:session][:email],
                           params[:session][:password])
  if user.nil?
    flash.now[:error] = "Invalid email/password combination."
    @title = "Sign in"
    render 'new'
  else
    sign_in user
    redirect_to posts_url
  end
end

  def destroy
    sign_out
    redirect_to posts_url
  end
end