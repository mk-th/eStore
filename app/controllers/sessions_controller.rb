class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    respond_to do |format|
    if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
        format.html { redirect_to root_url, notice: 'Successfully Logged In!' }
        # format.json { render :show, status: :created, location: @user }
      else
    	flash[:notice] = "Email or Password is invalid :-P"
        format.html { render :new } 
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	reset_session
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'Successfully Logged Out!' }
		# format.json { render :show, status: :created, location: @user }
    end


  end

  private

    def account_params
    end

end
