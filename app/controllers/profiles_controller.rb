class ProfilesController < ApplicationController

  before_action :move_to_index
  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    if profile.save
      redirect_to my_pages_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to my_pages_path
    else
      render action: :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:post_code, :tel_number, :prefecture, :city, :address, :building, :image, :introduction).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
