class CaloriesController < ApplicationController
  before_action :user_signed_in?
  before_action :correct_user,   only: [ :destroy, :show, :edit ]
  def index
    @calories = current_user.calories.page(params[:page]).per(30)
  end

  def new
    @calorie = current_user.calories.build if user_signed_in?
  end

  def edit
    @calorie = current_user.calories.find(params[:id])
  end

  def create
    @calorie = current_user.calories.build(calorie_params)
    if @calorie.save
      flash[:success] = "Register created successfully!"
      redirect_to calories_path
    else
      render 'new'
    end
  end

  def update
    @calorie = current_user.calories.find(params[:id])
    if @calorie.update_attributes(calorie_params)
      flash[:success] = "Register updated correctly!"
      redirect_to @calorie
    else
      render 'edit'
    end
  end

  def show
    @calorie = current_user.calories.find(params[:id])
  end

  def destroy
    @calorie.destroy
    flash[:success] = "Register deleted"
    redirect_to request.referrer || calories_path
  end

  def track
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
