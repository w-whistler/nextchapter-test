class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      session[:user_id] = user.id
      redirect_to invoices_path, notice: 'Successfully signed in.'
    else
      flash.now[:error] = 'Invalid email address.'
      render :new # For regular HTML requests
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Successfully signed out.'
  end
end
