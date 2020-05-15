class ApplicationController < ActionController::Base

  # before_action :set_categories
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  def rescue404
    render template: 'errors/not_found', status: 404
  end



  protect_from_forgery with: :exception
    # このコードがあると、Railsで生成されるすべてのフォームとAjaxリクエストにセキュリティトークンが自動的に含まれる。
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :'birth_day(1i)',:'birth_day(2i)',:'birth_day(3i)'])
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end
end