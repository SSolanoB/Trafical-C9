class CaloriesController < ApplicationController
  before_action :user_signed_in?
  before_action :correct_user,   only: :destroy
  def index
    @calories = current_user.calories.page(params[:page]).per(30)
  end

  def show
    @calorie = Calorie.find(params[:id])
  end

  def new
    @calorie = current_user.calories.build if user_signed_in?
  end

  private

    def calorie_params
      params.require(:calorie).permit(:number, :type_gained, :activity, :date)
    end

    def correct_user
      @calorie = current_user.calories.find_by(id: params[:id])
      redirect_to root_url if @calorie.nil?
    end

end
