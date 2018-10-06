class TrackResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  def new
  end

  def create
    @user = current_user
    if @user
      @user.create_track_digest
      @user.send_track_user_email(email: params[:track_reset][:email].downcase)
      flash[:info] = "Email sent with your progress"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    sign_in @user
    redirect_to track_path 
  end

  def shared_progress
    params
    @user = User.find_by(:token, value)
  end

  private

    def get_user
      @user = User.find_by(email: params[:email])
    end

end
