class TrackResetsController < ApplicationController

  before_action :user_signed_in?, only: [ :create, :update_goal ]
  def create
    @user = current_user
    if @user
      if @user.track_digest.nil?
        @user.create_track_digest
      end
      #@user.send_track_user_email(email: params[:track_reset][:email])
      TrackMailer.track_progress(@user, params[:track_reset][:email]).deliver_now
      flash[:info] = "Email sent with your progress"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not valid"
      render 'new'
    end
  end

  def update_goal
    @user = current_user
    if @user.update_attributes(goal: params[:goal_track_reset][:number])
      flash[:success] = "Goal updated correctly!"
      redirect_to track_path
    else
      flash[:danger] = "Number is not valid, try again"
      redirect_to track_path
    end
  end

  def shared_progress
    token = params[:token]
    @user = User.find_by(track_digest: token)
  end

end
