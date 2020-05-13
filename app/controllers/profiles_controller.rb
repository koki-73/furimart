class ProfilesController < ApplicationController

  before_action :move_to_index

  def new
    @profile = Profile.new
  end

  def create
    # @profile = Profile.new
    Profile.create(profile_params)
    redirect_to my_pages_path
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    # binding.pry
    @profile = Profile.find_by(user_id: current_user.id)
    @profile.update(profile_params)
    redirect_to my_pages_path
  end

  private

  def profile_params
    params.require(:profile).permit(:post_code, :tel_number, :prefecture, :city, :address, :bullding, :image, :introduction).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
